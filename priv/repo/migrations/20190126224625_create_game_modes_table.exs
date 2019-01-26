defmodule StratRouletteApi.Repo.Migrations.CreateGameModesTable do
  use Ecto.Migration

  def change do
    create table(:game_modes) do
      add :string, :name, null: false
      
      timestamps()
    end
  end
end
