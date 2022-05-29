defmodule SnowmailWeb.InboxLive.Index do
  use SnowmailWeb, :live_inbox_view

  alias Snowmail.Mailbox

  def mount(%{"email" => email, "host" => host}, _session, socket) do
    fullemail = email <> "@" <> host
    {:ok, assign(socket, email: fullemail, messages: [])}
  end
end
