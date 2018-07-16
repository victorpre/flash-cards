defmodule FlashCards.Cards.Translation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "translations" do
    field :correct, :boolean, default: false
    field :word_de, :string
    field :word_en, :string

    timestamps()
  end

  @doc false
  def changeset(translation, attrs) do
    translation
    |> cast(attrs, [:word_en, :word_de, :correct])
    |> unique_constraint(:word_en_word_de, message: "word already exists.")
    |> validate_required([:word_en, :word_de, :correct])
  end
end
