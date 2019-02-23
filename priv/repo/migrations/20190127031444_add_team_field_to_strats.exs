defmodule StratRouletteApi.Repo.Migrations.AddTeamFieldToStrats do
  use Ecto.Migration

  def change do
    TeamEnum.create_type()

    alter table(:strats) do
      add(:team, TeamEnum.type())
    end
  end
end
