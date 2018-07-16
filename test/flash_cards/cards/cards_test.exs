defmodule FlashCards.CardsTest do
  use FlashCards.DataCase

  alias FlashCards.Cards

  describe "translations" do
    alias FlashCards.Cards.Translation

    @valid_attrs %{correct: true, word_de: "some word_de", word_en: "some word_en"}
    @update_attrs %{correct: false, word_de: "some updated word_de", word_en: "some updated word_en"}
    @invalid_attrs %{correct: nil, word_de: nil, word_en: nil}

    def translation_fixture(attrs \\ %{}) do
      {:ok, translation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cards.create_translation()

      translation
    end

    test "list_translations/0 returns all translations" do
      translation = translation_fixture()
      assert Cards.list_translations() == [translation]
    end

    test "get_translation!/1 returns the translation with given id" do
      translation = translation_fixture()
      assert Cards.get_translation!(translation.id) == translation
    end

    test "create_translation/1 with valid data creates a translation" do
      assert {:ok, %Translation{} = translation} = Cards.create_translation(@valid_attrs)
      assert translation.correct == true
      assert translation.word_de == "some word_de"
      assert translation.word_en == "some word_en"
    end

    test "create_translation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cards.create_translation(@invalid_attrs)
    end

    test "update_translation/2 with valid data updates the translation" do
      translation = translation_fixture()
      assert {:ok, translation} = Cards.update_translation(translation, @update_attrs)
      assert %Translation{} = translation
      assert translation.correct == false
      assert translation.word_de == "some updated word_de"
      assert translation.word_en == "some updated word_en"
    end

    test "update_translation/2 with invalid data returns error changeset" do
      translation = translation_fixture()
      assert {:error, %Ecto.Changeset{}} = Cards.update_translation(translation, @invalid_attrs)
      assert translation == Cards.get_translation!(translation.id)
    end

    test "delete_translation/1 deletes the translation" do
      translation = translation_fixture()
      assert {:ok, %Translation{}} = Cards.delete_translation(translation)
      assert_raise Ecto.NoResultsError, fn -> Cards.get_translation!(translation.id) end
    end

    test "change_translation/1 returns a translation changeset" do
      translation = translation_fixture()
      assert %Ecto.Changeset{} = Cards.change_translation(translation)
    end
  end
end
