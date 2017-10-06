defmodule VirtualHearingsWeb.Router do
  use VirtualHearingsWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VirtualHearingsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/pois", PoiController
    resources "/hearings", HearingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", VirtualHearingsWeb do
  #   pipe_through :api
  # end
end
