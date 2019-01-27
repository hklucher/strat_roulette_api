defmodule StratRouletteApiWeb.StratView do
  use StratRouletteApiWeb, :view

  def render("random.json", %{strat: strat}) do
    %{
      id: strat.id,
      name: strat.name,
      description: strat.description
    }
  end
end