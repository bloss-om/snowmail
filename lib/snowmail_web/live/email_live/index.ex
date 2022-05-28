defmodule SnowmailWeb.EmailLive.Index do
  use SnowmailWeb, :live_view

  alias Snowmail.Mailbox
  alias Snowmail.Mailbox.Email

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :emails, list_emails())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Email")
    |> assign(:email, Mailbox.get_email!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Email")
    |> assign(:email, %Email{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Emails")
    |> assign(:email, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    email = Mailbox.get_email!(id)
    {:ok, _} = Mailbox.delete_email(email)

    {:noreply, assign(socket, :emails, list_emails())}
  end

  defp list_emails do
    Mailbox.list_emails()
  end
end
