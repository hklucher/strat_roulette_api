defmodule StratRouletteApi.Strats.Strat do
  use Ecto.Schema
  import Ecto.Changeset


  schema "strats" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(strat, attrs) do
    strat
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
