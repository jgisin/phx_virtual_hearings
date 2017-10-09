defmodule VirtualHearings.Repo.Migrations.CreateAttendees do
  use Ecto.Migration

  def change do
    create table(:attendees) do
      add :hearing_id, references(:hearings, on_delete: :nothing)
      add :poi_id, references(:pois, on_delete: :nothing)

      timestamps()
    end

    create index(:attendees, [:hearing_id])
    create index(:attendees, [:poi_id])
  end
end
