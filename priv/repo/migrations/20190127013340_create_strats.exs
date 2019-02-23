defmodule StratRouletteApi.Repo.Migrations.CreateStrats do
  use Ecto.Migration

  def change do
    create table(:strats) do
      add :name, :string, null: false
      add :description, :string, null: false

      timestamps()
    end

  end
end
