defmodule VirtualHearings.Repo.Migrations.CreatePois do
  use Ecto.Migration

  def change do
    create table(:pois) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :status, :integer
      add :added_by_role, :string
      add :added_by_id, :integer
      add :phone, :string

      timestamps()
    end

  end
end
