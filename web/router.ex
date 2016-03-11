defmodule Commander.Router do
  use Commander.Web, :router

  # Only initialize Sentry if required ENV variable available.
  if System.get_env("SENTRY_DSN") != nil do
    use ExSentry.Plug
  end

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

  scope "/", Commander do
    pipe_through :browser # Use the default browser stack

    scope "/system" do
      get "/health", SystemController, :health
      get "/info", SystemController, :info
      get "/error", SystemController, :error
      get "/email", SystemController, :email
    end

    get "/", PageController, :index
    get "/about", PageController, :about

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Commander do
  #   pipe_through :api
  # end
end
