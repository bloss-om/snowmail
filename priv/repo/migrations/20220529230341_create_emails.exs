defmodule Snowmail.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails, primary_key: false) do
      add :id, :uuid, primary_key: true

      add :email, :string
      add :host_id, references(:hosts)

      timestamps()
    end

    create unique_index(:emails, [:email, :host_id], comment: "Unique Email")
  end
end
