defmodule Snowmail.MailboxTest do
  use Snowmail.DataCase

  alias Snowmail.Mailbox

  describe "emails" do
    alias Snowmail.Mailbox.Email

    import Snowmail.MailboxFixtures

    @invalid_attrs %{email: nil}

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Mailbox.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Mailbox.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      valid_attrs = %{email: "some email"}

      assert {:ok, %Email{} = email} = Mailbox.create_email(valid_attrs)
      assert email.email == "some email"
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mailbox.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      update_attrs = %{email: "some updated email"}

      assert {:ok, %Email{} = email} = Mailbox.update_email(email, update_attrs)
      assert email.email == "some updated email"
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Mailbox.update_email(email, @invalid_attrs)
      assert email == Mailbox.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Mailbox.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Mailbox.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Mailbox.change_email(email)
    end
  end
end
