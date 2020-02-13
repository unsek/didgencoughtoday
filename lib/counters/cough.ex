defmodule Didgencoughtoday.Counters.Cough do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coughs" do
    field :number_of_times, :integer, default: 0

    timestamps()
  end

  def changeset(cough, attrs) do
    cough
    |> cast(attrs, [:number_of_times])
    |> validate_required([:number_of_times])
  end
end
