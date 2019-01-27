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

# game_types = ["Bomb", "Hostage", "Secure Area"]

# Enum.each(game_types, fn name -> 
#   changeset = GameType.changeset(%GameType{}, %{name: name})

#   Repo.insert!(changeset)
# end)

NimbleCSV.define(StratParser, separator: ",", escape: "\"")

# File.open!("attack_strats.csv")

"./priv/repo/attack_strats.csv"
|> Path.expand
|> File.stream!
|> StratParser.parse_stream
|> Stream.map(fn i -> IO.inspect(i) end)
|> Stream.run

# ""
# File.stream!("attack_strats.csv") |> CSV.decode |> Stream.map(fn i -> IO.inspect(i) end) |> Stream.run
# IO.inspect thing


# "./priv/repo/attack_strats.csv"
# |> Path.expand()
# |> File.stream!
# |> StratParser.parse_stream
# |> Stream.map(fn [name, description, game_type] ->
#   IO.inspect "#{name} #{description} #{game_type}"
# end)
