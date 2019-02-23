defmodule StratRouletteApi.Repo.Migrations.CreateGameTypes do
  use Ecto.Migration

  def change do
    create table(:game_types) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
