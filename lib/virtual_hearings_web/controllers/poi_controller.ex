defmodule VirtualHearingsWeb.PoiController do
  use VirtualHearingsWeb, :controller

  alias VirtualHearings.App
  alias VirtualHearings.App.Poi

  def index(conn, _params) do
    pois = App.list_pois()
    render(conn, "index.html", pois: pois)
  end

  def new(conn, _params) do
    changeset = App.change_poi(%Poi{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"poi" => poi_params}) do
    case App.create_poi(poi_params) do
      {:ok, poi} ->
        conn
        |> put_flash(:info, "Poi created successfully.")
        |> redirect(to: poi_path(conn, :show, poi))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poi = App.get_poi!(id)
    render(conn, "show.html", poi: poi)
  end

  def edit(conn, %{"id" => id}) do
    poi = App.get_poi!(id)
    changeset = App.change_poi(poi)
    render(conn, "edit.html", poi: poi, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poi" => poi_params}) do
    poi = App.get_poi!(id)

    case App.update_poi(poi, poi_params) do
      {:ok, poi} ->
        conn
        |> put_flash(:info, "Poi updated successfully.")
        |> redirect(to: poi_path(conn, :show, poi))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", poi: poi, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poi = App.get_poi!(id)
    {:ok, _poi} = App.delete_poi(poi)

    conn
    |> put_flash(:info, "Poi deleted successfully.")
    |> redirect(to: poi_path(conn, :index))
  end
end
