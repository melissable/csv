defmodule CSVParserWeb.Router do
  use CSVParserWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CSVParserWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
  
  scope "/api", CSVParserWeb do
    pipe_through :browser

    post "/process_csv", PageController, :process_csv
  end

  # Other scopes may use custom stacks.
  # scope "/api", CSVParserWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/monitor" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: CSVParserWeb.Telemetry
    end
  end
end
