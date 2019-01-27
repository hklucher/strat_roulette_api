defmodule StratRouletteApi.Strats.GameType do
  use Ecto.Schema
  import Ecto.Changeset


  schema "game_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(game_type, attrs) do
    game_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
