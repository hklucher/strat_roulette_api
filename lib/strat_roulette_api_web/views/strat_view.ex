defmodule StratRouletteApiWeb.StratView do
  use StratRouletteApiWeb, :view

  def render("random.json", %{strat: strat}) do
    %{strat: strat}
  end
end