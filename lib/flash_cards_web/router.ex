defmodule FlashCardsWeb.Router do
  use FlashCardsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FlashCardsWeb do
    pipe_through :api
    resources "/translations", TranslationController
  end
end
