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
alias StratRouletteApi.Repo

game_types = ["Bomb", "Hostage", "Secure Area"]

Enum.each(game_types, fn name -> 
  changeset = GameType.changeset(%GameType{}, %{name: name})

  Repo.insert!(changeset)
end)