defmodule VirtualHearings.App.Poi do
  use Ecto.Schema
  import Ecto.Changeset
  alias VirtualHearings.App.Poi


  schema "pois" do
    field :added_by_id, :integer
    field :added_by_role, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(%Poi{} = poi, attrs) do
    poi
    |> cast(attrs, [:first_name, :last_name, :email, :status, :added_by_role, :added_by_id, :phone])
    |> validate_required([:first_name, :last_name, :email, :status, :added_by_role, :added_by_id, :phone])
  end
end
