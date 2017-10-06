defmodule VirtualHearingsWeb.PoiControllerTest do
  use VirtualHearingsWeb.ConnCase

  alias VirtualHearings.App

  @create_attrs %{added_by_id: 42, added_by_role: "some added_by_role", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", status: 42}
  @update_attrs %{added_by_id: 43, added_by_role: "some updated added_by_role", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", status: 43}
  @invalid_attrs %{added_by_id: nil, added_by_role: nil, email: nil, first_name: nil, last_name: nil, phone: nil, status: nil}

  def fixture(:poi) do
    {:ok, poi} = App.create_poi(@create_attrs)
    poi
  end

  describe "index" do
    test "lists all pois", %{conn: conn} do
      conn = get conn, poi_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Pois"
    end
  end

  describe "new poi" do
    test "renders form", %{conn: conn} do
      conn = get conn, poi_path(conn, :new)
      assert html_response(conn, 200) =~ "New Poi"
    end
  end

  describe "create poi" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, poi_path(conn, :create), poi: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == poi_path(conn, :show, id)

      conn = get conn, poi_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Poi"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, poi_path(conn, :create), poi: @invalid_attrs
      assert html_response(conn, 200) =~ "New Poi"
    end
  end

  describe "edit poi" do
    setup [:create_poi]

    test "renders form for editing chosen poi", %{conn: conn, poi: poi} do
      conn = get conn, poi_path(conn, :edit, poi)
      assert html_response(conn, 200) =~ "Edit Poi"
    end
  end

  describe "update poi" do
    setup [:create_poi]

    test "redirects when data is valid", %{conn: conn, poi: poi} do
      conn = put conn, poi_path(conn, :update, poi), poi: @update_attrs
      assert redirected_to(conn) == poi_path(conn, :show, poi)

      conn = get conn, poi_path(conn, :show, poi)
      assert html_response(conn, 200) =~ "some updated added_by_role"
    end

    test "renders errors when data is invalid", %{conn: conn, poi: poi} do
      conn = put conn, poi_path(conn, :update, poi), poi: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Poi"
    end
  end

  describe "delete poi" do
    setup [:create_poi]

    test "deletes chosen poi", %{conn: conn, poi: poi} do
      conn = delete conn, poi_path(conn, :delete, poi)
      assert redirected_to(conn) == poi_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, poi_path(conn, :show, poi)
      end
    end
  end

  defp create_poi(_) do
    poi = fixture(:poi)
    {:ok, poi: poi}
  end
end
