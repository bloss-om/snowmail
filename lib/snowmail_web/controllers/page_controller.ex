defmodule SnowmailWeb.PageController do
  use SnowmailWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
