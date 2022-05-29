defmodule Snowmail.Mailbox.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :from, :string
    field :subject, :string
    field :email_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:subject, :from, :content])
    |> validate_required([:subject, :from, :content])
  end
end
