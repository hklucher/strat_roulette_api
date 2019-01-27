defmodule StratRouletteApi.Strats do
  @moduledoc """
  The Strats context.
  """

  import Ecto.Query, warn: false
  alias StratRouletteApi.Repo

  alias StratRouletteApi.Strats.GameType

  @doc """
  Returns the list of game_types.

  ## Examples

      iex> list_game_types()
      [%GameType{}, ...]

  """
  def list_game_types do
    Repo.all(GameType)
  end

  @doc """
  Gets a single game_type.

  Raises `Ecto.NoResultsError` if the Game type does not exist.

  ## Examples

      iex> get_game_type!(123)
      %GameType{}

      iex> get_game_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_type!(id), do: Repo.get!(GameType, id)

  @doc """
  Creates a game_type.

  ## Examples

      iex> create_game_type(%{field: value})
      {:ok, %GameType{}}

      iex> create_game_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_type(attrs \\ %{}) do
    %GameType{}
    |> GameType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_type.

  ## Examples

      iex> update_game_type(game_type, %{field: new_value})
      {:ok, %GameType{}}

      iex> update_game_type(game_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_type(%GameType{} = game_type, attrs) do
    game_type
    |> GameType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GameType.

  ## Examples

      iex> delete_game_type(game_type)
      {:ok, %GameType{}}

      iex> delete_game_type(game_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_type(%GameType{} = game_type) do
    Repo.delete(game_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_type changes.

  ## Examples

      iex> change_game_type(game_type)
      %Ecto.Changeset{source: %GameType{}}

  """
  def change_game_type(%GameType{} = game_type) do
    GameType.changeset(game_type, %{})
  end

  alias StratRouletteApi.Strats.Strat

  @doc """
  Returns the list of strats.

  ## Examples

      iex> list_strats()
      [%Strat{}, ...]

  """
  def list_strats do
    Repo.all(Strat)
  end

  @doc """
  Gets a single strat.

  Raises `Ecto.NoResultsError` if the Strat does not exist.

  ## Examples

      iex> get_strat!(123)
      %Strat{}

      iex> get_strat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_strat!(id), do: Repo.get!(Strat, id)

  @doc """
  Creates a strat.

  ## Examples

      iex> create_strat(%{field: value})
      {:ok, %Strat{}}

      iex> create_strat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_strat(attrs \\ %{}) do
    %Strat{}
    |> Strat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a strat.

  ## Examples

      iex> update_strat(strat, %{field: new_value})
      {:ok, %Strat{}}

      iex> update_strat(strat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_strat(%Strat{} = strat, attrs) do
    strat
    |> Strat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Strat.

  ## Examples

      iex> delete_strat(strat)
      {:ok, %Strat{}}

      iex> delete_strat(strat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_strat(%Strat{} = strat) do
    Repo.delete(strat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking strat changes.

  ## Examples

      iex> change_strat(strat)
      %Ecto.Changeset{source: %Strat{}}

  """
  def change_strat(%Strat{} = strat) do
    Strat.changeset(strat, %{})
  end
end
