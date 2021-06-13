defmodule Exmoveit.Profile_Data do
  @moduledoc """
    false
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmoveit.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:current_experience, :current_level, :tasks_completed]

  schema "profile_data" do
    field :current_experience, :decimal
    field :current_level, :integer
    field :tasks_completed, :integer

    belongs_to :users, User

    timestamps()
  end

  def changeset(%{} = attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(profile__data, attrs) do
    profile__data
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
