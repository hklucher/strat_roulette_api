defmodule StratRouletteApiWeb.StratView do
  use StratRouletteApiWeb, :view

  def render("not_found.json", %{}) do
    %{errors: ["Could not find valid strat"]}
  end

  def render("random.json", %{strat: strat}) do
    %{
      id: strat.id,
      name: strat.name,
      description: strat.description,
    }
  end
end