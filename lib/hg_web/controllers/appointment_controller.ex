defmodule HgWeb.AppointmentController do
  use HgWeb, :controller

  alias Hg.Appointments
  alias Hg.Appointments.Appointment
  alias Hg.Repo

  def index(conn, _params) do
    appointments = Appointments.list_appointments()
    topics = Appointments.list_topics()
    difficulties = Appointments.list_difficulties()
    statuses = Appointments.list_statuses()

    render(conn, :index,
      appointments: appointments,
      topics: topics,
      difficulties: difficulties,
      statuses: statuses
    )
  end

  def new(conn, _params) do
    changeset = Appointments.change_appointment(%Appointment{})
    topics = Appointments.list_topics()
    difficulties = Appointments.list_difficulties()
    statuses = Appointments.list_statuses()

    render(conn, :new,
      changeset: changeset,
      topics: topics,
      difficulties: difficulties,
      statuses: statuses
    )
  end

  def create(conn, %{"appointment" => appointment_params}) do
    case Appointments.create_appointment(appointment_params) do
      {:ok, appointment} ->
        conn
        |> put_flash(:info, "Appointment created successfully.")
        |> redirect(to: ~p"/consultei/appointments/#{appointment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        topics = Appointments.list_topics()
        difficulties = Appointments.list_difficulties()
        statuses = Appointments.list_statuses()
        render(conn, :new,
          changeset: changeset,
          topics: topics,
          difficulties: difficulties,
          statuses: statuses
        )
    end
  end

  def show(conn, %{"id" => id}) do
    appointment = Appointments.get_appointment!(id)
    |> Repo.preload(:topic)
    |> Repo.preload(:difficulties)
    |> Repo.preload(:status)
    render(conn, :show, appointment: appointment )
  end

  def edit(conn, %{"id" => id}) do
    appointment = Appointments.get_appointment!(id)
    changeset = Appointments.change_appointment(appointment)
    topics = Appointments.list_topics()
    difficulties = Appointments.list_difficulties()
    statuses = Appointments.list_statuses()

    render(conn, :edit,
      appointment: appointment,
      changeset: changeset,
      topics: topics,
      difficulties: difficulties,
      statuses: statuses
    )
  end

  def update(conn, %{"id" => id, "appointment" => appointment_params}) do
    appointment = Appointments.get_appointment!(id)

    case Appointments.update_appointment(appointment, appointment_params) do
      {:ok, appointment} ->
        conn
        |> put_flash(:info, "Appointment updated successfully.")
        |> redirect(to: ~p"/consultei/appointments/#{appointment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        topics = Appointments.list_topics()
        difficulties = Appointments.list_difficulties()
        statuses = Appointments.list_statuses()
        render(conn, :edit,
          appointment: appointment,
          changeset: changeset,
          topics: topics,
          difficulties: difficulties,
          statuses: statuses
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    appointment = Appointments.get_appointment!(id)
    {:ok, _appointment} = Appointments.delete_appointment(appointment)

    conn
    |> put_flash(:info, "Appointment deleted successfully.")
    |> redirect(to: ~p"/consultei/appointments")
  end
end
