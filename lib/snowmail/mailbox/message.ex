defmodule Snowmail.Mailbox.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snowmail.Mailbox.Email

  schema "messages" do
    field :content, :string
    field :from, :string
    field :subject, :string

    belongs_to :email, Email

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:subject, :from, :content])
    |> validate_required([:subject, :from, :content])
  end
end
