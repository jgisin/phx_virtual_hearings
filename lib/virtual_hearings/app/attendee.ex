defmodule VirtualHearings.App.Attendee do
  use Ecto.Schema
  import Ecto.Changeset
  alias VirtualHearings.App.Attendee


  schema "attendees" do
    field :hearing_id, :id
    field :poi_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Attendee{} = attendee, attrs) do
    attendee
    |> cast(attrs, [])
    |> validate_required([])
  end
end
