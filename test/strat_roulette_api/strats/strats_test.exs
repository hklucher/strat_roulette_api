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
end
