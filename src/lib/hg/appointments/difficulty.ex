defmodule Hg.Appointments.Difficulty do
  use Ecto.Schema
  import Ecto.Changeset

  schema "difficulties" do
    field(:level, :string)
    has_many(:appointments, Hg.Appointments.Appointment)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(difficulty, attrs) do
    difficulty
    |> cast(attrs, [:level])
    |> validate_required([:level])
  end
end
