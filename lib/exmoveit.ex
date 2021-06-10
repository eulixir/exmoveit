defmodule Exmoveit do
  @moduledoc """
  Exmoveit keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Exmoveit.User
  alias Exmoveit.Users.Create, as: UsersCreate

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
end
