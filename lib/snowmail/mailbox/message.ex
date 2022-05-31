defmodule Snowmail.Mailbox.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snowmail.Mailbox.Email

  schema "messages" do
    field :content, :string
    field :from, :string
    field :subject, :string

    belongs_to :email, Email, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:subject, :from, :content, :email_id])
    |> validate_required([:subject, :from, :content, :email_id])
  end

  def change_email(message, email) do
    message
    |> change()
    |> put_assoc(:email, email)
  end
end
