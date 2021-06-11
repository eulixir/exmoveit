defmodule Exmoveit.Profile_Data do
  @moduledoc """
    false
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmoveit.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "profile_data" do
    field :current_experience, :decimal
    field :current_level, :integer
    field :tasks_completed, :integer

    belongs_to :users, User

    timestamps()
  end

  def changeset(profile__data, attrs) do
    profile__data
    |> cast(attrs, [:current_experience, :current_level, :tasks_completed])
    |> validate_required([:current_experience, :current_level, :tasks_completed])
  end
end
