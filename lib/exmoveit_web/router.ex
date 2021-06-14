defmodule ExmoveitWeb.Router do
  use ExmoveitWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: ["http://localhost:3000/"]
  end

  scope "/api", ExmoveitWeb do
    pipe_through :api

    post "/users", UsersController, :create

    get "/users/get_by_id/:id", UsersController, :by_id
    get "/users/get_by_email/:email", UsersController, :by_email
    get "/users/get_all", UsersController, :show_all

    put "/profile_data", ProfileDataController, :update
    get "/profile_data/:email", ProfileDataController, :show_by_email
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  import Phoenix.LiveDashboard.Router

  scope "/" do
    pipe_through [:fetch_session, :protect_from_forgery]
    live_dashboard "/dashboard", metrics: ExmoveitWeb.Telemetry
  end

  # end
end
