defmodule Snowmail.MailboxFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snowmail.Mailbox` context.
  """

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        email: "some email"
      })
      |> Snowmail.Mailbox.create_email()

    email
  end
end
