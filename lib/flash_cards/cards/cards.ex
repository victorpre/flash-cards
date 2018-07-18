defmodule FlashCards.Cards do
  @moduledoc """
  The Cards context.
  """

  import Ecto.Query, warn: false
  alias FlashCards.Repo

  alias FlashCards.Cards.Translation

  @doc """
  Returns the list of translations.

  ## Examples

      iex> list_translations()
      [%Translation{}, ...]

  """
  def list_translations do
    Repo.all(Translation)
  end

  @doc """
  Gets a single translation.

  Raises `Ecto.NoResultsError` if the Translation does not exist.

  ## Examples

      iex> get_translation!(123)
      %Translation{}

      iex> get_translation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_translation!(id), do: Repo.get!(Translation, id)

  @doc """
  Gets the translation with latest id in DB.

  ## Examples

      iex> get_last_translation
      %Translation{}

  """

  def get_last_translation, do: Repo.one(from(x in Translation, order_by: [desc: x.id], limit: 1))

  @doc """
  Creates a translation.

  ## Examples

      iex> create_translation(%{field: value})
      {:ok, %Translation{}}

      iex> create_translation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_translation(attrs \\ %{}) do
    %Translation{}
    |> Translation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a translation.

  ## Examples

      iex> update_translation(translation, %{field: new_value})
      {:ok, %Translation{}}

      iex> update_translation(translation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_translation(%Translation{} = translation, attrs) do
    translation
    |> Translation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Translation.

  ## Examples

      iex> delete_translation(translation)
      {:ok, %Translation{}}

      iex> delete_translation(translation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_translation(%Translation{} = translation) do
    Repo.delete(translation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking translation changes.

  ## Examples

      iex> change_translation(translation)
      %Ecto.Changeset{source: %Translation{}}

  """
  def change_translation(%Translation{} = translation) do
    Translation.changeset(translation, %{})
  end

  @doc """
  Gets a random Translation with a `false` correct attribute.

  ## Examples

  iex> get_random_incorrect_translation()
  %Translation{}

  """
  def get_random_incorrect_translation do
    Translation
    |> incorrect_translations
    |> Repo.all()
    |> Enum.random()
  end

  @doc """
  Returns a list of incorrect translations.

  ## Examples

  iex> incorrect_translations()
  [%Translation{}, ...]

  """
  def incorrect_translations(query) do
    from(
      t in query,
      where: t.correct == false,
      select: t
    )
  end
end
