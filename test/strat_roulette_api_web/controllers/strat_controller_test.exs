defmodule StratRouletteApiWeb.StratControllerTest do
  use StratRouletteApiWeb.ConnCase

  test "GET /random", %{conn: conn} do
    strat = insert(:strat)

    conn = get conn, "/api/strats/random"
    assert json_response(conn, 200)
  end
end