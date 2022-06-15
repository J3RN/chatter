defmodule Chatter.Repo.Migrations.CreateConversants do
  use Ecto.Migration

  def change do
    create table(:conversants) do
      add(:username, :string, null: false)

      timestamps()
    end
  end
end
