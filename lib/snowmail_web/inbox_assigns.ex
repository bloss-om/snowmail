defmodule SnowmailWeb.InboxAssigns do
  use Phoenix.LiveView

  alias Snowmail.Mailbox

  def on_mount(:default, params, _session, socket) do
    IO.inspect(params)

    case params do
      %{"email" => email, "host" => host_name} ->
        {:cont, socket |> assign(:email, Mailbox.get_email!(email, host_name))}

      _ ->
        {:halt, redirect(socket, to: "/")}
    end
  end
end
