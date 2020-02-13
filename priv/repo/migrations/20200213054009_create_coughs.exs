defmodule Didgencoughtoday.Repo.Migrations.CreateCoughs do
  use Ecto.Migration

  def change do
    create table(:coughs) do
      add :number, :integer

      timestamps()
    end

  end
end
