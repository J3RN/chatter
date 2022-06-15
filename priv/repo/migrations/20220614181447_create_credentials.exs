defmodule ChatterInfra.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add(:conversant_id, references(:conversants), null: false)
      add(:password_hash, :string, null: false)

      timestamps()
    end
  end
end
