defmodule SnowmailWeb.EmailLive.FormComponent do
  use SnowmailWeb, :live_component

  alias Snowmail.Mailbox

  @impl true
  def update(%{email: email} = assigns, socket) do
    changeset = Mailbox.change_email(email)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"email" => email_params}, socket) do
    changeset =
      socket.assigns.email
      |> Mailbox.change_email(email_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"email" => email_params}, socket) do
    save_email(socket, socket.assigns.action, email_params)
  end

  defp save_email(socket, :edit, email_params) do
    case Mailbox.update_email(socket.assigns.email, email_params) do
      {:ok, _email} ->
        {:noreply,
         socket
         |> put_flash(:info, "Email updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_email(socket, :new, email_params) do
    case Mailbox.create_email(email_params) do
      {:ok, _email} ->
        {:noreply,
         socket
         |> put_flash(:info, "Email created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
