defmodule Snowmail.Mailbox.Email do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snowmail.Mailbox.Host
  alias Snowmail.Mailbox.Message

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "emails" do
    field :email, :string
    belongs_to :host, Host
    has_many :messages, Message

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:email, :host_id])
    |> validate_required([:email, :host_id])
    |> unique_constraint([:email, :host_id])
    |> validate_format(:email, ~r/^[a-zA-Z0-9_.+-]+/)
  end
end
