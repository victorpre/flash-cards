defmodule FlashCardsWeb.TranslationController do
  use FlashCardsWeb, :controller

  alias FlashCards.Cards
  alias FlashCards.Cards.Translation

  action_fallback FlashCardsWeb.FallbackController

  def index(conn, _params) do
    translations = Cards.list_translations()
    render(conn, "index.json", translations: translations)
  end

  def create(conn, %{"translation" => translation_params}) do
    with {:ok, %Translation{} = translation} <- Cards.create_translation(translation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", translation_path(conn, :show, translation))
      |> render("show.json", translation: translation)
    end
  end

  def show(conn, %{"id" => id}) do
    translation = Cards.get_translation!(id)
    render(conn, "show.json", translation: translation)
  end

  def update(conn, %{"id" => id, "translation" => translation_params}) do
    translation = Cards.get_translation!(id)

    with {:ok, %Translation{} = translation} <- Cards.update_translation(translation, translation_params) do
      render(conn, "show.json", translation: translation)
    end
  end

  def delete(conn, %{"id" => id}) do
    translation = Cards.get_translation!(id)
    with {:ok, %Translation{}} <- Cards.delete_translation(translation) do
      send_resp(conn, :no_content, "")
    end
  end
end
