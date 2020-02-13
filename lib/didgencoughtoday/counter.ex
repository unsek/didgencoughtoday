defmodule Didgencoughtoday.Counter do
  @moduledoc """
  The Counter context.
  """

  import Ecto.Query, warn: false
  alias Didgencoughtoday.Repo

  alias Didgencoughtoday.Counter.Cough

  @doc """
  Returns the list of coughs.

  ## Examples

      iex> list_coughs()
      [%Cough{}, ...]

  """
  def list_coughs do
    Repo.all(Cough)
  end

  @doc """
  Gets a single cough.

  Raises `Ecto.NoResultsError` if the Cough does not exist.

  ## Examples

      iex> get_cough!(123)
      %Cough{}

      iex> get_cough!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cough!(id), do: Repo.get!(Cough, id)

  @doc """
  Creates a cough.

  ## Examples

      iex> create_cough(%{field: value})
      {:ok, %Cough{}}

      iex> create_cough(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cough(attrs \\ %{}) do
    %Cough{}
    |> Cough.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cough.

  ## Examples

      iex> update_cough(cough, %{field: new_value})
      {:ok, %Cough{}}

      iex> update_cough(cough, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cough(%Cough{} = cough, attrs) do
    cough
    |> Cough.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cough.

  ## Examples

      iex> delete_cough(cough)
      {:ok, %Cough{}}

      iex> delete_cough(cough)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cough(%Cough{} = cough) do
    Repo.delete(cough)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cough changes.

  ## Examples

      iex> change_cough(cough)
      %Ecto.Changeset{source: %Cough{}}

  """
  def change_cough(%Cough{} = cough) do
    Cough.changeset(cough, %{})
  end

  def get_first_cough() do
    Repo.one(Cough)
  end
end
