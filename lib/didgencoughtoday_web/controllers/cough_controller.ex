defmodule DidgencoughtodayWeb.CoughController do
  use DidgencoughtodayWeb, :controller

  alias Didgencoughtoday.Counter
  alias Didgencoughtoday.Counter.Cough

  def index(conn, _params) do
    cough = Counter.get_first_cough()
    render(conn, "index.html", cough: cough)
  end

  def new(conn, _params) do
    changeset = Counter.change_cough(%Cough{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cough" => cough_params}) do
    case Counter.create_cough(cough_params) do
      {:ok, cough} ->
        conn
        |> put_flash(:info, "Cough created successfully.")
        |> redirect(to: Routes.cough_path(conn, :show, cough))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cough = Counter.get_cough!(id)
    render(conn, "show.html", cough: cough)
  end

  # def edit(conn, %{"id" => id}) do
  #   cough = Counter.get_cough!(id)
  #   changeset = Counter.change_cough(cough)
  #   render(conn, "edit.html", cough: cough, changeset: changeset)
  # end

  def update(conn, %{"id" => id, "cough" => cough_params}) do
    cough = Counter.get_cough!(id)

    case Counter.update_cough(cough, cough_params) do
      {:ok, cough} ->
        conn
        |> put_flash(:info, "Cough updated successfully.")
        |> redirect(to: Routes.cough_path(conn, :show, cough))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cough: cough, changeset: changeset)
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   cough = Counter.get_cough!(id)
  #   {:ok, _cough} = Counter.delete_cough(cough)

  #   conn
  #   |> put_flash(:info, "Cough deleted successfully.")
  #   |> redirect(to: Routes.cough_path(conn, :index))
  # end
end
