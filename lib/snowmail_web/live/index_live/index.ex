defmodule SnowmailWeb.IndexLive.Index do
  use SnowmailWeb, :live_view

  alias Snowmail.Mailbox

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> init_assigns()
     |> fetch()}
  end

  defp init_assigns(socket) do
    email = %Mailbox.Email{}

    socket
    |> assign(hosts: [], hosts_options: [], email: email)
    |> assign(:changeset, Mailbox.change_email(email))
  end

  def handle_event("submit", %{"email" => email_params}, socket) do
    email = Mailbox.find_email(email_params)

    if email do
      {:noreply, go_to_email(socket, email)}
    else
      case Mailbox.create_email(email_params) do
        {:ok, email} ->
          {:noreply, go_to_email(socket, email)}

        {:error, changeset} ->
          {:noreply, assign(socket, changeset: changeset)}
      end
    end
  end

  def handle_event("validate", %{"email" => email_params}, socket) do
    changeset =
      socket.assigns.email
      |> Mailbox.change_email(email_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def fetch(socket) do
    socket
    |> fetch_hosts()
  end

  defp fetch_hosts(socket) do
    hosts = Mailbox.list_hosts()
    options = hosts |> Enum.map(&{"@" <> &1.name, &1.id})

    socket
    |> assign(:hosts, hosts)
    |> assign(:hosts_options, options)
  end

  defp get_hostname(socket, id) do
    socket.assigns.hosts |> Enum.find(&(&1.id == id))
  end

  defp go_to_email(socket, email) do
    socket
    |> redirect(
      to:
        Routes.inbox_index_path(
          socket,
          :index,
          email.email,
          get_hostname(socket, email.host_id).name
        )
    )
  end
end
