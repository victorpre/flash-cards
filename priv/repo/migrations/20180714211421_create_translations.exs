defmodule FlashCards.Repo.Migrations.CreateTranslations do
  use Ecto.Migration

  def change do
    create table(:translations) do
      add :word_en, :string
      add :word_de, :string
      add :correct, :boolean, default: false, null: false

      timestamps()
    end

    create index(:translations, [:word_en, :word_de], unique: true)
  end
end
