defmodule StratRouletteApi.Strats.Strat do
  use Ecto.Schema
  import Ecto.Changeset
  alias StratRouletteApi.Strats.GameType

  schema "strats" do
    field :description, :string
    field :name, :string
    field :team, TeamEnum

    many_to_many :game_types, GameType, join_through: "game_type_strats"

    timestamps()
  end

  @doc false
  def changeset(strat, attrs) do
    strat
    |> cast(attrs, [:name, :description, :team])
    |> validate_required([:name, :description])
  end
end
