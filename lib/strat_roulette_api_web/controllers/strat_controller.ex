defmodule StratRouletteApiWeb.StratController do
  use StratRouletteApiWeb, :controller

  def random(conn, params) do
    strat = StratRouletteApi.Strats.random_strat()

    IO.inspect strat

    render conn, "random.json", strat: strat
  end
end