defmodule StratRouletteApiWeb.Router do
  use StratRouletteApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StratRouletteApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", StratRouletteApiWeb do
    pipe_through :api

    get "/strats/random", StratController, :random

    resources "/strats", StratController, only: [:index] 
  end
end
