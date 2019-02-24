defmodule StratRouletteApiWeb.StratView do
  use StratRouletteApiWeb, :view

  def render("index.json", %{strats: strats}) do
    %{
      strats: Enum.map(strats, &strat_json/1)
    }
  end

  def render("strat.json", strat) do
    %{
      id: strat.id,
      name: strat.name,
      description: strat.description,
    }
  end

  def render("not_found.json", %{}) do
    %{errors: ["Could not find valid strat"]}
  end

  def render("random.json", %{strat: strat}) do
    strat_json(strat)
  end

  defp strat_json(strat) do
    %{
      id: strat.id,
      name: strat.name,
      description: strat.description,
      team: strat.team
    }
  end
end
