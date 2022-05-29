# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Snowmail.Repo.insert!(%Snowmail.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Snowmail.Seeds do
  alias Snowmail.Repo
  alias Snowmail.Mailbox.Host

  def import_demo() do
    insert_demo_hosts()
  end

  def insert_demo_hosts() do
    [
      %Host{name: "snow.mail"},
      %Host{name: "cold.mail"},
      %Host{name: "frozen.mail"}
    ]
    |> Enum.each(&Repo.insert!(&1))
  end
end

Snowmail.Seeds.import_demo()
