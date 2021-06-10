defmodule Exmoveit.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :email, :name, :image]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:email, :image, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(%{} = attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:email)
  end
end
