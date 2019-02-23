# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StratRouletteApi.Repo.insert!(%StratRouletteApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias StratRouletteApi.Strats.GameType
alias StratRouletteApi.Strats.Strat
alias StratRouletteApi.Repo

# game_types = ["Bomb", "Hostage", "Secure Area"]

# Enum.each(game_types, fn name -> 
#   changeset = GameType.changeset(%GameType{}, %{name: name})

#   Repo.insert!(changeset)
# end)

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
