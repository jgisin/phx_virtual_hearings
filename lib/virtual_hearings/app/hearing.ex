defmodule VirtualHearings.App.Hearing do
  use Ecto.Schema
  import Ecto.Changeset
  alias VirtualHearings.App.Hearing


  schema "hearings" do
    field :cmr_code, :string
    field :date_time, :date
    has_many :attendee, VirtualHearings.App.Attendee

    timestamps()
  end

  @doc false
  def changeset(%Hearing{} = hearing, attrs) do
    hearing
    |> cast(attrs, [:cmr_code, :date_time])
    |> validate_required([:cmr_code, :date_time])
  end
end
