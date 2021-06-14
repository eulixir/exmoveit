defmodule Exmoveit.ProfileData do
  @moduledoc """
    false
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmoveit.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:user_id, :current_experience, :current_level, :tasks_completed]

  schema "profile_data" do
    field :current_experience, :decimal, default: 0
    field :current_level, :integer, default: 0
    field :tasks_completed, :integer, default: 0

    belongs_to :user, User

    timestamps()
  end

  def changeset(%{} = attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(profile_data, attrs) do
    profile_data
    |> cast(attrs, @required_params)
  end
end
