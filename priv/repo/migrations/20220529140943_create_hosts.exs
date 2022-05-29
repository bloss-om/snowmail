defmodule Snowmail.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create table(:hosts) do
      add :name, :string

      timestamps()
    end
  end
end
