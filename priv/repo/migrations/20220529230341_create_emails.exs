defmodule Snowmail.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :email, :string
      add :host_id, references(:hosts)

      timestamps()
    end
  end
end
