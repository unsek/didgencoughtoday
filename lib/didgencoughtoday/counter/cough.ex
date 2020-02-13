defmodule Didgencoughtoday.Counter.Cough do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coughs" do
    field :number, :integer

    timestamps()
  end

  @doc false
  def changeset(cough, attrs) do
    cough
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
