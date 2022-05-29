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

  describe "hosts" do
    alias Snowmail.Mailbox.Host

    import Snowmail.MailboxFixtures

    @invalid_attrs %{name: nil}

    test "list_hosts/0 returns all hosts" do
      host = host_fixture()
      assert Mailbox.list_hosts() == [host]
    end

    test "get_host!/1 returns the host with given id" do
      host = host_fixture()
      assert Mailbox.get_host!(host.id) == host
    end

    test "create_host/1 with valid data creates a host" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Host{} = host} = Mailbox.create_host(valid_attrs)
      assert host.name == "some name"
    end

    test "create_host/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mailbox.create_host(@invalid_attrs)
    end

    test "update_host/2 with valid data updates the host" do
      host = host_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Host{} = host} = Mailbox.update_host(host, update_attrs)
      assert host.name == "some updated name"
    end

    test "update_host/2 with invalid data returns error changeset" do
      host = host_fixture()
      assert {:error, %Ecto.Changeset{}} = Mailbox.update_host(host, @invalid_attrs)
      assert host == Mailbox.get_host!(host.id)
    end

    test "delete_host/1 deletes the host" do
      host = host_fixture()
      assert {:ok, %Host{}} = Mailbox.delete_host(host)
      assert_raise Ecto.NoResultsError, fn -> Mailbox.get_host!(host.id) end
    end

    test "change_host/1 returns a host changeset" do
      host = host_fixture()
      assert %Ecto.Changeset{} = Mailbox.change_host(host)
    end
  end

  describe "messages" do
    alias Snowmail.Mailbox.Message

    import Snowmail.MailboxFixtures

    @invalid_attrs %{content: nil, from: nil, subject: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Mailbox.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Mailbox.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{content: "some content", from: "some from", subject: "some subject"}

      assert {:ok, %Message{} = message} = Mailbox.create_message(valid_attrs)
      assert message.content == "some content"
      assert message.from == "some from"
      assert message.subject == "some subject"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mailbox.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{content: "some updated content", from: "some updated from", subject: "some updated subject"}

      assert {:ok, %Message{} = message} = Mailbox.update_message(message, update_attrs)
      assert message.content == "some updated content"
      assert message.from == "some updated from"
      assert message.subject == "some updated subject"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Mailbox.update_message(message, @invalid_attrs)
      assert message == Mailbox.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Mailbox.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Mailbox.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Mailbox.change_message(message)
    end
  end
end
