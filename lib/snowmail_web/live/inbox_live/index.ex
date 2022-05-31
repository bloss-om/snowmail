defmodule SnowmailWeb.InboxLive.Index do
  use SnowmailWeb, :live_inbox_view

  alias Snowmail.Mailbox

  def mount(%{"email" => email, "host" => host}, _session, socket) do
    fullemail = email <> "@" <> host

    {:ok,
     socket
     |> assign(email_text: fullemail, messages: [])
     |> fetch_messages()}
  end

  def fetch_messages(socket) do
    %{email: email} = socket.assigns

    socket
    |> assign(:messages, Mailbox.list_messages_by_email(email))
  end
end
