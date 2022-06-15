defmodule ChatterInfra.Repo.Migrations.CreateConversants do
  use Ecto.Migration

  def change do
    create table(:conversants) do
      add(:username, :string, null: false)
      add(:email, :string, null: false)

      timestamps()
    end

    create unique_index(:conversants, [:email])
  end
end
