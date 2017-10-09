defmodule VirtualHearings.App do
  @moduledoc """
  The App context.
  """

  import Ecto.Query, warn: false
  alias VirtualHearings.Repo

  alias VirtualHearings.App.Poi

  @doc """
  Returns the list of pois.

  ## Examples

      iex> list_pois()
      [%Poi{}, ...]

  """
  def list_pois do
    Repo.all(Poi)
  end

  @doc """
  Gets a single poi.

  Raises `Ecto.NoResultsError` if the Poi does not exist.

  ## Examples

      iex> get_poi!(123)
      %Poi{}

      iex> get_poi!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poi!(id), do: Repo.get!(Poi, id)

  @doc """
  Creates a poi.

  ## Examples

      iex> create_poi(%{field: value})
      {:ok, %Poi{}}

      iex> create_poi(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poi(attrs \\ %{}) do
    %Poi{}
    |> Poi.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poi.

  ## Examples

      iex> update_poi(poi, %{field: new_value})
      {:ok, %Poi{}}

      iex> update_poi(poi, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poi(%Poi{} = poi, attrs) do
    poi
    |> Poi.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Poi.

  ## Examples

      iex> delete_poi(poi)
      {:ok, %Poi{}}

      iex> delete_poi(poi)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poi(%Poi{} = poi) do
    Repo.delete(poi)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poi changes.

  ## Examples

      iex> change_poi(poi)
      %Ecto.Changeset{source: %Poi{}}

  """
  def change_poi(%Poi{} = poi) do
    Poi.changeset(poi, %{})
  end

  alias VirtualHearings.App.Hearing

  @doc """
  Returns the list of hearings.

  ## Examples

      iex> list_hearings()
      [%Hearing{}, ...]

  """
  def list_hearings do
    Repo.all(Hearing)
  end

  @doc """
  Gets a single hearing.

  Raises `Ecto.NoResultsError` if the Hearing does not exist.

  ## Examples

      iex> get_hearing!(123)
      %Hearing{}

      iex> get_hearing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hearing!(id), do: Repo.get!(Hearing, id)

  @doc """
  Creates a hearing.

  ## Examples

      iex> create_hearing(%{field: value})
      {:ok, %Hearing{}}

      iex> create_hearing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hearing(attrs \\ %{}) do
    %Hearing{}
    |> Hearing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hearing.

  ## Examples

      iex> update_hearing(hearing, %{field: new_value})
      {:ok, %Hearing{}}

      iex> update_hearing(hearing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hearing(%Hearing{} = hearing, attrs) do
    hearing
    |> Hearing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hearing.

  ## Examples

      iex> delete_hearing(hearing)
      {:ok, %Hearing{}}

      iex> delete_hearing(hearing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hearing(%Hearing{} = hearing) do
    Repo.delete(hearing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hearing changes.

  ## Examples

      iex> change_hearing(hearing)
      %Ecto.Changeset{source: %Hearing{}}

  """
  def change_hearing(%Hearing{} = hearing) do
    Hearing.changeset(hearing, %{})
  end

  alias VirtualHearings.App.Attendee

  @doc """
  Returns the list of attendees.

  ## Examples

      iex> list_attendees()
      [%Attendee{}, ...]

  """
  def list_attendees do
    Repo.all(Attendee)
  end

  @doc """
  Gets a single attendee.

  Raises `Ecto.NoResultsError` if the Attendee does not exist.

  ## Examples

      iex> get_attendee!(123)
      %Attendee{}

      iex> get_attendee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attendee!(id), do: Repo.get!(Attendee, id)

  @doc """
  Creates a attendee.

  ## Examples

      iex> create_attendee(%{field: value})
      {:ok, %Attendee{}}

      iex> create_attendee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attendee(attrs \\ %{}) do
    %Attendee{}
    |> Attendee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attendee.

  ## Examples

      iex> update_attendee(attendee, %{field: new_value})
      {:ok, %Attendee{}}

      iex> update_attendee(attendee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attendee(%Attendee{} = attendee, attrs) do
    attendee
    |> Attendee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Attendee.

  ## Examples

      iex> delete_attendee(attendee)
      {:ok, %Attendee{}}

      iex> delete_attendee(attendee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attendee(%Attendee{} = attendee) do
    Repo.delete(attendee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attendee changes.

  ## Examples

      iex> change_attendee(attendee)
      %Ecto.Changeset{source: %Attendee{}}

  """
  def change_attendee(%Attendee{} = attendee) do
    Attendee.changeset(attendee, %{})
  end
end
