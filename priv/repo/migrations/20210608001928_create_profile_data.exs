defmodule Exmoveit.Repo.Migrations.CreateProfileData do
  use Ecto.Migration

  def change do
    create table(:profile_data, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :current_experience, :integer, default: 0
      add :current_level, :integer, default: 1
      add :tasks_completed, :integer, default: 0

      add :user_id, references(:users, type: :binary_id)
      timestamps()
    end
  end
end
