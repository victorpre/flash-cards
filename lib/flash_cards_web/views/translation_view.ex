defmodule FlashCardsWeb.TranslationView do
  use FlashCardsWeb, :view
  alias FlashCardsWeb.TranslationView

  def render("index.json", %{translations: translations}) do
    %{data: render_many(translations, TranslationView, "translation.json")}
  end

  def render("show.json", %{translation: translation}) do
    %{data: render_one(translation, TranslationView, "translation.json")}
  end

  def render("translation.json", %{translation: translation}) do
    %{id: translation.id,
      word_en: translation.word_en,
      word_de: translation.word_de,
      correct: translation.correct}
  end
end
