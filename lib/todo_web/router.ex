defmodule TodoWeb.Router do
  use TodoWeb, :router

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

  scope "/", TodoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/tasks", TaskController, :index  
    post "/tasks/create", TaskController, :create  
    get "/tasks/new", TaskController, :new 
    get "/tasks/show/:id", TaskController, :show
    get "/tasks/edit/:id", TaskController, :edit
    delete "/tasks/delete/:id", TaskController, :delete
    put "/tasks/update/:id", TaskController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoWeb do
  #   pipe_through :api
  # end
end
