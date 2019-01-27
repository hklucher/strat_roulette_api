defmodule StratRouletteApi.StratsTest do
  use StratRouletteApi.DataCase

  alias StratRouletteApi.Strats

  describe "game_types" do
    alias StratRouletteApi.Strats.GameType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def game_type_fixture(attrs \\ %{}) do
      {:ok, game_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Strats.create_game_type()

      game_type
    end

    test "list_game_types/0 returns all game_types" do
      game_type = game_type_fixture()
      assert Strats.list_game_types() == [game_type]
    end

    test "get_game_type!/1 returns the game_type with given id" do
      game_type = game_type_fixture()
      assert Strats.get_game_type!(game_type.id) == game_type
    end

    test "create_game_type/1 with valid data creates a game_type" do
      assert {:ok, %GameType{} = game_type} = Strats.create_game_type(@valid_attrs)
      assert game_type.name == "some name"
    end

    test "create_game_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Strats.create_game_type(@invalid_attrs)
    end

    test "update_game_type/2 with valid data updates the game_type" do
      game_type = game_type_fixture()
      assert {:ok, game_type} = Strats.update_game_type(game_type, @update_attrs)
      assert %GameType{} = game_type
      assert game_type.name == "some updated name"
    end

    test "update_game_type/2 with invalid data returns error changeset" do
      game_type = game_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Strats.update_game_type(game_type, @invalid_attrs)
      assert game_type == Strats.get_game_type!(game_type.id)
    end

    test "delete_game_type/1 deletes the game_type" do
      game_type = game_type_fixture()
      assert {:ok, %GameType{}} = Strats.delete_game_type(game_type)
      assert_raise Ecto.NoResultsError, fn -> Strats.get_game_type!(game_type.id) end
    end

    test "change_game_type/1 returns a game_type changeset" do
      game_type = game_type_fixture()
      assert %Ecto.Changeset{} = Strats.change_game_type(game_type)
    end
  end

  describe "strats" do
    alias StratRouletteApi.Strats.Strat

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def strat_fixture(attrs \\ %{}) do
      {:ok, strat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Strats.create_strat()

      strat
    end

    test "list_strats/0 returns all strats" do
      strat = strat_fixture()
      assert Strats.list_strats() == [strat]
    end

    test "get_strat!/1 returns the strat with given id" do
      strat = strat_fixture()
      assert Strats.get_strat!(strat.id) == strat
    end

    test "create_strat/1 with valid data creates a strat" do
      assert {:ok, %Strat{} = strat} = Strats.create_strat(@valid_attrs)
      assert strat.description == "some description"
      assert strat.name == "some name"
    end

    test "create_strat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Strats.create_strat(@invalid_attrs)
    end

    test "update_strat/2 with valid data updates the strat" do
      strat = strat_fixture()
      assert {:ok, strat} = Strats.update_strat(strat, @update_attrs)
      assert %Strat{} = strat
      assert strat.description == "some updated description"
      assert strat.name == "some updated name"
    end

    test "update_strat/2 with invalid data returns error changeset" do
      strat = strat_fixture()
      assert {:error, %Ecto.Changeset{}} = Strats.update_strat(strat, @invalid_attrs)
      assert strat == Strats.get_strat!(strat.id)
    end

    test "delete_strat/1 deletes the strat" do
      strat = strat_fixture()
      assert {:ok, %Strat{}} = Strats.delete_strat(strat)
      assert_raise Ecto.NoResultsError, fn -> Strats.get_strat!(strat.id) end
    end

    test "change_strat/1 returns a strat changeset" do
      strat = strat_fixture()
      assert %Ecto.Changeset{} = Strats.change_strat(strat)
    end
  end
end
