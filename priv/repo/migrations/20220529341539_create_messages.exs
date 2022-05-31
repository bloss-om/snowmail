defmodule Snowmail.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :subject, :string
      add :from, :string
      add :content, :text

      add :email_id, references(:emails, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:email_id])
  end
end
