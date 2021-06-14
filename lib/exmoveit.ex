defmodule Exmoveit do
  @moduledoc """
  Exmoveit keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Exmoveit.User
  alias Exmoveit.Users.Create, as: UsersCreate
  alias Exmoveit.Users.Get, as: UsersGet
  # alias Exmoveit.Users.Update, as: UsersUpdate

  alias Exmoveit.ProfilesData.Create, as: ProfilesDataCreate
  alias Exmoveit.ProfilesData.Get, as: ProfilesDataGet

  @spec create_user(%{email: String.t()}) ::
          {:error, %{status: :bad_request, result: Ecto.Changeset.t()}}
          | {:ok, %User{}}
  @doc """
  Inserts a user into the database.

  ## Examples

        iex> user_params = %{email: "mike@gmail.com"}

        iex> {:ok, %Exmoveit.User{}} = Exmoveit.create_user(user_params)

  """
  defdelegate create_user(params), to: UsersCreate, as: :call
  # defdelegate update_user(params), to: UsersUpdate, as: :call
  defdelegate get_all_users, to: UsersGet, as: :get_all
  defdelegate get_user(id), to: UsersGet, as: :by_id
  defdelegate get_user_by_email(email), to: UsersGet, as: :by_email

  defdelegate create_profile_data(params), to: ProfilesDataCreate, as: :call
  defdelegate get_profile_data(id), to: ProfilesDataGet, as: :by_id
end
