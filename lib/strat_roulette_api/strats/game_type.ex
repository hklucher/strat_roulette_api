defmodule StratRouletteApi.Strats.GameType do
  use Ecto.Schema
  import Ecto.Changeset
  alias StratRouletteApi.Strats.Strat

  schema "game_types" do
    field :name, :string

    many_to_many :strats, Strat, join_through: "game_type_strats"

    timestamps()
  end

  @doc false
  def changeset(game_type, attrs) do
    game_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
