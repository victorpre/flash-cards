defmodule FlashCardsWeb.TranslationControllerTest do
  use FlashCardsWeb.ConnCase

  alias FlashCards.Cards
  alias FlashCards.Cards.Translation

  @create_attrs %{correct: true, word_de: "some word_de", word_en: "some word_en"}
  @update_attrs %{correct: false, word_de: "some updated word_de", word_en: "some updated word_en"}
  @invalid_attrs %{correct: nil, word_de: nil, word_en: nil}

  def fixture(:translation) do
    {:ok, translation} = Cards.create_translation(@create_attrs)
    translation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all translations", %{conn: conn} do
      conn = get conn, translation_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create translation" do
    test "renders translation when data is valid", %{conn: conn} do
      conn = post conn, translation_path(conn, :create), translation: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, translation_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "correct" => true,
        "word_de" => "some word_de",
        "word_en" => "some word_en"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, translation_path(conn, :create), translation: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update translation" do
    setup [:create_translation]

    test "renders translation when data is valid", %{conn: conn, translation: %Translation{id: id} = translation} do
      conn = put conn, translation_path(conn, :update, translation), translation: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, translation_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "correct" => false,
        "word_de" => "some updated word_de",
        "word_en" => "some updated word_en"}
    end

    test "renders errors when data is invalid", %{conn: conn, translation: translation} do
      conn = put conn, translation_path(conn, :update, translation), translation: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete translation" do
    setup [:create_translation]

    test "deletes chosen translation", %{conn: conn, translation: translation} do
      conn = delete conn, translation_path(conn, :delete, translation)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, translation_path(conn, :show, translation)
      end
    end
  end

  defp create_translation(_) do
    translation = fixture(:translation)
    {:ok, translation: translation}
  end
end
