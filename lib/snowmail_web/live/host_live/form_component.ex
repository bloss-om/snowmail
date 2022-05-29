defmodule SnowmailWeb.HostLive.FormComponent do
  use SnowmailWeb, :live_component

  alias Snowmail.Mailbox

  @impl true
  def update(%{host: host} = assigns, socket) do
    changeset = Mailbox.change_host(host)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"host" => host_params}, socket) do
    changeset =
      socket.assigns.host
      |> Mailbox.change_host(host_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"host" => host_params}, socket) do
    save_host(socket, socket.assigns.action, host_params)
  end

  defp save_host(socket, :edit, host_params) do
    case Mailbox.update_host(socket.assigns.host, host_params) do
      {:ok, _host} ->
        {:noreply,
         socket
         |> put_flash(:info, "Host updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_host(socket, :new, host_params) do
    case Mailbox.create_host(host_params) do
      {:ok, _host} ->
        {:noreply,
         socket
         |> put_flash(:info, "Host created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
