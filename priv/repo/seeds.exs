alias StratRouletteApi.Strats.GameType
alias StratRouletteApi.Strats.Strat
alias StratRouletteApi.Repo


NimbleCSV.define(StratParser, separator: ",", escape: "\"")

defmodule Seeds do
  defmodule Strats do
    def seed(team) do
      team
      |> filename
      |> Path.expand()
      |> File.stream!()
      |> StratParser.parse_stream()
      |> Stream.map(fn data -> seed_strat(data, team) end)
      |> Stream.run()
    end

    defp seed_strat([name, description, game_type], team) do
      changeset = Strat.changeset(%Strat{}, %{name: name, description: description, team: team})

      Repo.insert!(changeset)
    end

    defp filename("attack"), do: "./priv/repo/attack_strats.csv"
    defp filename("defense"), do: "./priv/repo/defense_strats.csv"
  end
end

Seeds.Strats.seed("defense")
Seeds.Strats.seed("attack")
