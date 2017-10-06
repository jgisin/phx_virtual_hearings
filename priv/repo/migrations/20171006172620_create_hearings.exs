defmodule VirtualHearings.Repo.Migrations.CreateHearings do
  use Ecto.Migration

  def change do
    create table(:hearings) do
      add :cmr_code, :string
      add :date_time, :date

      timestamps()
    end

  end
end
