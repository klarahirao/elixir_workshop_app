defmodule ElixirWorkshopApp.Router do
  use ElixirWorkshopApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirWorkshopApp do
    pipe_through :browser # Use the default browser stack

    get "/", RoomController, :index
    get "/registrations/new", RegistrationController, :new
    post "/registrations", RegistrationController, :create
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
    get    "/rooms/new",  RoomController, :new
    post   "/rooms",  RoomController, :create
    delete "/rooms/:id", RoomController, :delete
    get "/rooms/:id", RoomController, :show
  end
end
