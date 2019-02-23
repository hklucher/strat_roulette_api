defmodule StratRouletteApi.Factory do
  use ExMachina.Ecto, repo: StratRouletteApi.Repo

  def strat_factory do
    %StratRouletteApi.Strats.Strat{
      name: "A test name",
      description: "A test description",
      team: "attack"
    }
  end
end