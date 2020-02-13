defmodule DidgencoughtodayWeb.Router do
  use DidgencoughtodayWeb, :router

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

  scope "/", DidgencoughtodayWeb do
    pipe_through :browser

    resources "/", CoughController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DidgencoughtodayWeb do
  #   pipe_through :api
  # end
end
