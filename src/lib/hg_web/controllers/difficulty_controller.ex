defmodule HgWeb.DifficultyController do
  use HgWeb, :controller

  alias Hg.Appointments
  alias Hg.Appointments.Difficulty

  def index(conn, _params) do
    difficulties = Appointments.list_difficulties()
    render(conn, :index, difficulties: difficulties)
  end

  def new(conn, _params) do
    changeset = Appointments.change_difficulty(%Difficulty{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"difficulty" => difficulty_params}) do
    case Appointments.create_difficulty(difficulty_params) do
      {:ok, difficulty} ->
        conn
        |> put_flash(:info, "Difficulty created successfully.")
        |> redirect(to: ~p"/consultei/difficulties/#{difficulty}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    difficulty = Appointments.get_difficulty!(id)
    render(conn, :show, difficulty: difficulty)
  end

  def edit(conn, %{"id" => id}) do
    difficulty = Appointments.get_difficulty!(id)
    changeset = Appointments.change_difficulty(difficulty)
    render(conn, :edit, difficulty: difficulty, changeset: changeset)
  end

  def update(conn, %{"id" => id, "difficulty" => difficulty_params}) do
    difficulty = Appointments.get_difficulty!(id)

    case Appointments.update_difficulty(difficulty, difficulty_params) do
      {:ok, difficulty} ->
        conn
        |> put_flash(:info, "Difficulty updated successfully.")
        |> redirect(to: ~p"/consultei/difficulties/#{difficulty}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, difficulty: difficulty, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    difficulty = Appointments.get_difficulty!(id)
    {:ok, _difficulty} = Appointments.delete_difficulty(difficulty)

    conn
    |> put_flash(:info, "Difficulty deleted successfully.")
    |> redirect(to: ~p"/consultei/difficulties")
  end
end
