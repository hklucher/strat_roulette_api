defmodule StratRouletteApi.Repo.Migrations.CreateGameModeStrats do
  use Ecto.Migration

  def change do
    create table(:game_type_strats) do
      add :strat_id, :integer, null: false
      add :game_type_id, :integer, null: false
      
      timestamps()
    end
  end
end
