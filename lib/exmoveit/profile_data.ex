defmodule Exmoveit.ProfileData do
  @moduledoc """
    false
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmoveit.User

  @required_params [:user_id, :current_experience, :current_level, :tasks_completed]
  @derive {Jason.Encoder, only: @required_params ++ [:id, :user]}
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "profile_data" do
    field :current_experience, :integer, default: 0
    field :current_level, :integer, default: 1
    field :tasks_completed, :integer, default: 0

    belongs_to :user, User, type: :binary_id

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
