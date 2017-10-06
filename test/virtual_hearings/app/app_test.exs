defmodule VirtualHearings.AppTest do
  use VirtualHearings.DataCase

  alias VirtualHearings.App

  describe "pois" do
    alias VirtualHearings.App.Poi

    @valid_attrs %{added_by_id: 42, added_by_role: "some added_by_role", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", status: 42}
    @update_attrs %{added_by_id: 43, added_by_role: "some updated added_by_role", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", status: 43}
    @invalid_attrs %{added_by_id: nil, added_by_role: nil, email: nil, first_name: nil, last_name: nil, phone: nil, status: nil}

    def poi_fixture(attrs \\ %{}) do
      {:ok, poi} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_poi()

      poi
    end

    test "list_pois/0 returns all pois" do
      poi = poi_fixture()
      assert App.list_pois() == [poi]
    end

    test "get_poi!/1 returns the poi with given id" do
      poi = poi_fixture()
      assert App.get_poi!(poi.id) == poi
    end

    test "create_poi/1 with valid data creates a poi" do
      assert {:ok, %Poi{} = poi} = App.create_poi(@valid_attrs)
      assert poi.added_by_id == 42
      assert poi.added_by_role == "some added_by_role"
      assert poi.email == "some email"
      assert poi.first_name == "some first_name"
      assert poi.last_name == "some last_name"
      assert poi.phone == "some phone"
      assert poi.status == 42
    end

    test "create_poi/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_poi(@invalid_attrs)
    end

    test "update_poi/2 with valid data updates the poi" do
      poi = poi_fixture()
      assert {:ok, poi} = App.update_poi(poi, @update_attrs)
      assert %Poi{} = poi
      assert poi.added_by_id == 43
      assert poi.added_by_role == "some updated added_by_role"
      assert poi.email == "some updated email"
      assert poi.first_name == "some updated first_name"
      assert poi.last_name == "some updated last_name"
      assert poi.phone == "some updated phone"
      assert poi.status == 43
    end

    test "update_poi/2 with invalid data returns error changeset" do
      poi = poi_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_poi(poi, @invalid_attrs)
      assert poi == App.get_poi!(poi.id)
    end

    test "delete_poi/1 deletes the poi" do
      poi = poi_fixture()
      assert {:ok, %Poi{}} = App.delete_poi(poi)
      assert_raise Ecto.NoResultsError, fn -> App.get_poi!(poi.id) end
    end

    test "change_poi/1 returns a poi changeset" do
      poi = poi_fixture()
      assert %Ecto.Changeset{} = App.change_poi(poi)
    end
  end

  describe "hearings" do
    alias VirtualHearings.App.Hearing

    @valid_attrs %{cmr_code: "some cmr_code", date_time: ~D[2010-04-17]}
    @update_attrs %{cmr_code: "some updated cmr_code", date_time: ~D[2011-05-18]}
    @invalid_attrs %{cmr_code: nil, date_time: nil}

    def hearing_fixture(attrs \\ %{}) do
      {:ok, hearing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_hearing()

      hearing
    end

    test "list_hearings/0 returns all hearings" do
      hearing = hearing_fixture()
      assert App.list_hearings() == [hearing]
    end

    test "get_hearing!/1 returns the hearing with given id" do
      hearing = hearing_fixture()
      assert App.get_hearing!(hearing.id) == hearing
    end

    test "create_hearing/1 with valid data creates a hearing" do
      assert {:ok, %Hearing{} = hearing} = App.create_hearing(@valid_attrs)
      assert hearing.cmr_code == "some cmr_code"
      assert hearing.date_time == ~D[2010-04-17]
    end

    test "create_hearing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_hearing(@invalid_attrs)
    end

    test "update_hearing/2 with valid data updates the hearing" do
      hearing = hearing_fixture()
      assert {:ok, hearing} = App.update_hearing(hearing, @update_attrs)
      assert %Hearing{} = hearing
      assert hearing.cmr_code == "some updated cmr_code"
      assert hearing.date_time == ~D[2011-05-18]
    end

    test "update_hearing/2 with invalid data returns error changeset" do
      hearing = hearing_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_hearing(hearing, @invalid_attrs)
      assert hearing == App.get_hearing!(hearing.id)
    end

    test "delete_hearing/1 deletes the hearing" do
      hearing = hearing_fixture()
      assert {:ok, %Hearing{}} = App.delete_hearing(hearing)
      assert_raise Ecto.NoResultsError, fn -> App.get_hearing!(hearing.id) end
    end

    test "change_hearing/1 returns a hearing changeset" do
      hearing = hearing_fixture()
      assert %Ecto.Changeset{} = App.change_hearing(hearing)
    end
  end
end
