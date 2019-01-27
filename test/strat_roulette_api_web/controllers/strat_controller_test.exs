defmodule StratRouletteApiWeb.StratControllerTest do
  use StratRouletteApiWeb.ConnCase

  test "GET /random", %{conn: conn} do
    strat = insert(:strat)

    conn = get(conn, "/api/strats/random", %{"team" => "attack"})
    assert json_response(conn, 200)
  end

  test "GET /random responds with 404 when no strat found", %{conn: conn} do
    conn = get(conn, "/api/strats/random", %{"team" => "attack"})
    assert json_response(conn, 404)
  end
end