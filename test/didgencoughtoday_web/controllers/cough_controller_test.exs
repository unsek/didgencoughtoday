defmodule DidgencoughtodayWeb.CoughControllerTest do
  use DidgencoughtodayWeb.ConnCase

  alias Didgencoughtoday.Counter

  @create_attrs %{number: 42}
  @update_attrs %{number: 43}
  @invalid_attrs %{number: nil}

  def fixture(:cough) do
    {:ok, cough} = Counter.create_cough(@create_attrs)
    cough
  end

  describe "index" do
    test "lists all coughs", %{conn: conn} do
      conn = get(conn, Routes.cough_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Coughs"
    end
  end

  describe "new cough" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cough_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cough"
    end
  end

  describe "create cough" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cough_path(conn, :create), cough: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cough_path(conn, :show, id)

      conn = get(conn, Routes.cough_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cough"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cough_path(conn, :create), cough: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cough"
    end
  end

  describe "edit cough" do
    setup [:create_cough]

    test "renders form for editing chosen cough", %{conn: conn, cough: cough} do
      conn = get(conn, Routes.cough_path(conn, :edit, cough))
      assert html_response(conn, 200) =~ "Edit Cough"
    end
  end

  describe "update cough" do
    setup [:create_cough]

    test "redirects when data is valid", %{conn: conn, cough: cough} do
      conn = put(conn, Routes.cough_path(conn, :update, cough), cough: @update_attrs)
      assert redirected_to(conn) == Routes.cough_path(conn, :show, cough)

      conn = get(conn, Routes.cough_path(conn, :show, cough))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cough: cough} do
      conn = put(conn, Routes.cough_path(conn, :update, cough), cough: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cough"
    end
  end

  describe "delete cough" do
    setup [:create_cough]

    test "deletes chosen cough", %{conn: conn, cough: cough} do
      conn = delete(conn, Routes.cough_path(conn, :delete, cough))
      assert redirected_to(conn) == Routes.cough_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cough_path(conn, :show, cough))
      end
    end
  end

  defp create_cough(_) do
    cough = fixture(:cough)
    {:ok, cough: cough}
  end
end
