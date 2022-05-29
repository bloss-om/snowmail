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

  @doc """
  Generate a host.
  """
  def host_fixture(attrs \\ %{}) do
    {:ok, host} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Snowmail.Mailbox.create_host()

    host
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content",
        from: "some from",
        subject: "some subject"
      })
      |> Snowmail.Mailbox.create_message()

    message
  end
end
