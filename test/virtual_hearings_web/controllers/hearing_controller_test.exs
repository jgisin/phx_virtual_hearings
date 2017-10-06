defmodule VirtualHearingsWeb.HearingControllerTest do
  use VirtualHearingsWeb.ConnCase

  alias VirtualHearings.App

  @create_attrs %{cmr_code: "some cmr_code", date_time: ~D[2010-04-17]}
  @update_attrs %{cmr_code: "some updated cmr_code", date_time: ~D[2011-05-18]}
  @invalid_attrs %{cmr_code: nil, date_time: nil}

  def fixture(:hearing) do
    {:ok, hearing} = App.create_hearing(@create_attrs)
    hearing
  end

  describe "index" do
    test "lists all hearings", %{conn: conn} do
      conn = get conn, hearing_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Hearings"
    end
  end

  describe "new hearing" do
    test "renders form", %{conn: conn} do
      conn = get conn, hearing_path(conn, :new)
      assert html_response(conn, 200) =~ "New Hearing"
    end
  end

  describe "create hearing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, hearing_path(conn, :create), hearing: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == hearing_path(conn, :show, id)

      conn = get conn, hearing_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Hearing"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, hearing_path(conn, :create), hearing: @invalid_attrs
      assert html_response(conn, 200) =~ "New Hearing"
    end
  end

  describe "edit hearing" do
    setup [:create_hearing]

    test "renders form for editing chosen hearing", %{conn: conn, hearing: hearing} do
      conn = get conn, hearing_path(conn, :edit, hearing)
      assert html_response(conn, 200) =~ "Edit Hearing"
    end
  end

  describe "update hearing" do
    setup [:create_hearing]

    test "redirects when data is valid", %{conn: conn, hearing: hearing} do
      conn = put conn, hearing_path(conn, :update, hearing), hearing: @update_attrs
      assert redirected_to(conn) == hearing_path(conn, :show, hearing)

      conn = get conn, hearing_path(conn, :show, hearing)
      assert html_response(conn, 200) =~ "some updated cmr_code"
    end

    test "renders errors when data is invalid", %{conn: conn, hearing: hearing} do
      conn = put conn, hearing_path(conn, :update, hearing), hearing: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Hearing"
    end
  end

  describe "delete hearing" do
    setup [:create_hearing]

    test "deletes chosen hearing", %{conn: conn, hearing: hearing} do
      conn = delete conn, hearing_path(conn, :delete, hearing)
      assert redirected_to(conn) == hearing_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, hearing_path(conn, :show, hearing)
      end
    end
  end

  defp create_hearing(_) do
    hearing = fixture(:hearing)
    {:ok, hearing: hearing}
  end
end
