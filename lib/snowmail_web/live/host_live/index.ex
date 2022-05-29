defmodule SnowmailWeb.HostLive.Index do
  use SnowmailWeb, :live_view

  alias Snowmail.Mailbox
  alias Snowmail.Mailbox.Host

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :hosts, list_hosts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Host")
    |> assign(:host, Mailbox.get_host!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Host")
    |> assign(:host, %Host{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Hosts")
    |> assign(:host, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    host = Mailbox.get_host!(id)
    {:ok, _} = Mailbox.delete_host(host)

    {:noreply, assign(socket, :hosts, list_hosts())}
  end

  defp list_hosts do
    Mailbox.list_hosts()
  end
end
