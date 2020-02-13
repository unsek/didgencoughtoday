defmodule Didgencoughtoday.CounterTest do
  use Didgencoughtoday.DataCase

  alias Didgencoughtoday.Counter

  describe "coughs" do
    alias Didgencoughtoday.Counter.Cough

    @valid_attrs %{number: 42}
    @update_attrs %{number: 43}
    @invalid_attrs %{number: nil}

    def cough_fixture(attrs \\ %{}) do
      {:ok, cough} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Counter.create_cough()

      cough
    end

    test "list_coughs/0 returns all coughs" do
      cough = cough_fixture()
      assert Counter.list_coughs() == [cough]
    end

    test "get_cough!/1 returns the cough with given id" do
      cough = cough_fixture()
      assert Counter.get_cough!(cough.id) == cough
    end

    test "create_cough/1 with valid data creates a cough" do
      assert {:ok, %Cough{} = cough} = Counter.create_cough(@valid_attrs)
      assert cough.number == 42
    end

    test "create_cough/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Counter.create_cough(@invalid_attrs)
    end

    test "update_cough/2 with valid data updates the cough" do
      cough = cough_fixture()
      assert {:ok, %Cough{} = cough} = Counter.update_cough(cough, @update_attrs)
      assert cough.number == 43
    end

    test "update_cough/2 with invalid data returns error changeset" do
      cough = cough_fixture()
      assert {:error, %Ecto.Changeset{}} = Counter.update_cough(cough, @invalid_attrs)
      assert cough == Counter.get_cough!(cough.id)
    end

    test "delete_cough/1 deletes the cough" do
      cough = cough_fixture()
      assert {:ok, %Cough{}} = Counter.delete_cough(cough)
      assert_raise Ecto.NoResultsError, fn -> Counter.get_cough!(cough.id) end
    end

    test "change_cough/1 returns a cough changeset" do
      cough = cough_fixture()
      assert %Ecto.Changeset{} = Counter.change_cough(cough)
    end
  end
end
