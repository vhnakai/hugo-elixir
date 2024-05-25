defmodule Hg.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add(:start_time, :naive_datetime)
      add(:end_time, :naive_datetime)
      add(:description, :string)

      add(:topic_id, references(:topics, on_delete: :nothing))
      add(:difficulty_id, references(:difficulties, on_delete: :nothing))
      add(:status_id, references(:statuses, on_delete: :nothing))

      timestamps(type: :utc_datetime)
    end

    create(index(:appointments, [:topic_id]))
    create(index(:appointments, [:difficulty_id]))
    create(index(:appointments, [:status_id]))
  end
end
