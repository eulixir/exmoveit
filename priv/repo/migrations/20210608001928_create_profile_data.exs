defmodule Exmoveit.Repo.Migrations.CreateProfileData do
  use Ecto.Migration

  def change do
    create table(:profile_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :current_experience, :decimal
      add :current_level, :integer
      add :tasks_completed, :integer

      add :users_id, references(:users, type: :binary_id)
      timestamps()
    end
  end
end
