defmodule Exmoveit.User do
  @moduledoc """
    false
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmoveit.ProfileData

  @derive {Jason.Encoder, only: [:id, :email, :name, :image]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:email, :image, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :image, :string

    has_one :profile_data, ProfileData
    timestamps()
  end

  def changeset(%{} = attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params)
    |> cast_assoc(:profile_data)
    |> validate_required(@required_params)
    |> unique_constraint(:email)
  end
end
