defmodule VirtualHearingsWeb.HearingController do
  use VirtualHearingsWeb, :controller

  alias VirtualHearings.App
  alias VirtualHearings.App.Hearing

  def index(conn, _params) do
    hearings = App.list_hearings()
    render(conn, "index.html", hearings: hearings)
  end

  def new(conn, _params) do
    changeset = App.change_hearing(%Hearing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hearing" => hearing_params}) do
    case App.create_hearing(hearing_params) do
      {:ok, hearing} ->
        conn
        |> put_flash(:info, "Hearing created successfully.")
        |> redirect(to: hearing_path(conn, :show, hearing))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hearing = App.get_hearing!(id)
    render(conn, "show.html", hearing: hearing)
  end

  def edit(conn, %{"id" => id}) do
    hearing = App.get_hearing!(id)
    changeset = App.change_hearing(hearing)
    render(conn, "edit.html", hearing: hearing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hearing" => hearing_params}) do
    hearing = App.get_hearing!(id)

    case App.update_hearing(hearing, hearing_params) do
      {:ok, hearing} ->
        conn
        |> put_flash(:info, "Hearing updated successfully.")
        |> redirect(to: hearing_path(conn, :show, hearing))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hearing: hearing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hearing = App.get_hearing!(id)
    {:ok, _hearing} = App.delete_hearing(hearing)

    conn
    |> put_flash(:info, "Hearing deleted successfully.")
    |> redirect(to: hearing_path(conn, :index))
  end
end
