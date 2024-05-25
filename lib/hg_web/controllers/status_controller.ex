defmodule HgWeb.StatusController do
  use HgWeb, :controller

  alias Hg.Appointments
  alias Hg.Appointments.Status

  def index(conn, _params) do
    statuses = Appointments.list_statuses()
    render(conn, :index, statuses: statuses)
  end

  def new(conn, _params) do
    changeset = Appointments.change_status(%Status{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"status" => status_params}) do
    case Appointments.create_status(status_params) do
      {:ok, status} ->
        conn
        |> put_flash(:info, "Status created successfully.")
        |> redirect(to: ~p"/consultei/statuses/#{status}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    status = Appointments.get_status!(id)
    render(conn, :show, status: status)
  end

  def edit(conn, %{"id" => id}) do
    status = Appointments.get_status!(id)
    changeset = Appointments.change_status(status)
    render(conn, :edit, status: status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "status" => status_params}) do
    status = Appointments.get_status!(id)

    case Appointments.update_status(status, status_params) do
      {:ok, status} ->
        conn
        |> put_flash(:info, "Status updated successfully.")
        |> redirect(to: ~p"/consultei/statuses/#{status}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, status: status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    status = Appointments.get_status!(id)
    {:ok, _status} = Appointments.delete_status(status)

    conn
    |> put_flash(:info, "Status deleted successfully.")
    |> redirect(to: ~p"/consultei/statuses")
  end
end
