defmodule StratRouletteApi.Strats.GameTypeStrat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_type_strats" do
    belongs_to :game_type, GameType
    belongs_to :strat, Strat

    timestamps()
  end
end