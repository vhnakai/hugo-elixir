defmodule Hg.Repo.Migrations.CreateDifficulties do
  use Ecto.Migration

  def change do
    create table(:difficulties) do
      add :level, :string

      timestamps(type: :utc_datetime)
    end
  end
end
