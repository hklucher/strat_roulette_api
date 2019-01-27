defmodule StratRouletteApiWeb.StratController do
  use StratRouletteApiWeb, :controller

  def random(conn, params) do
    strat = StratRouletteApi.Strats.random_strat("attack")
    render conn, "random.json", strat: strat
  end
end