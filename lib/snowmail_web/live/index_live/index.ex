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
    socket
    |> assign(hosts: [], hosts_options: [])
    |> assign(:changeset, Mailbox.change_email(%Mailbox.Email{}))
  end

  def fetch(socket) do
    socket
    |> fetch_hosts()
  end

  defp fetch_hosts(socket) do
    hosts = Mailbox.list_hosts()
    options = hosts |> Enum.map(&{"@" <> &1.name, &1.id})

    IO.inspect(options)

    socket
    |> assign(:hosts, hosts)
    |> assign(:hosts_options, options)
  end
end
