defmodule Hg.Appointments.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appointments" do
    field(:description, :string)
    field(:start_time, :naive_datetime)
    field(:end_time, :naive_datetime)

    belongs_to(:topic, Hg.Appointments.Topic)
    belongs_to(:difficulty, Hg.Appointments.Difficulty)
    belongs_to(:status, Hg.Appointments.Status)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:start_time, :end_time, :description, :topic_id, :difficulty_id, :status_id])
    |> validate_required([
      :start_time,
      :end_time,
      :description,
      :topic_id,
      :difficulty_id,
      :status_id
    ])
    |> assoc_constraint(:topic)
    |> assoc_constraint(:difficulty)
    |> assoc_constraint(:status)
  end
end
