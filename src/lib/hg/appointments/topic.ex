defmodule Hg.Appointments.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field(:name, :string)
    has_many(:appointments, Hg.Appointments.Appointment)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
