defmodule StratRouletteApiWeb.StratController do
  use StratRouletteApiWeb, :controller

  def index(conn, _params) do
    render(conn, "strats.json", [])
  end

  # GET /api/strats/random?team=attack
  def random(conn, %{"team" => "attack"}) do
    strat = StratRouletteApi.Strats.random_strat(:attack)
    render_strat(conn, strat)
  end

  # GET /api/strats/random?team=defense
  def random(conn, %{"team" => "defense"}) do
    strat = StratRouletteApi.Strats.random_strat(:defense)
    render_strat(conn, strat)
  end

  defp render_strat(conn, strat) do
    case strat do
      %StratRouletteApi.Strats.Strat{} ->
        render(conn, "random.json", strat: strat)

      _ ->
        conn
        |> put_status(:not_found)
        |> render("not_found.json")
    end
  end
end
