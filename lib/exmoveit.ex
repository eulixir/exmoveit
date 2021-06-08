defmodule Exmoveit do
  @moduledoc """
  Exmoveit keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Exmoveit.Users.Create, as: UsersCreate

  @spec create_user(%{email: String.t()}) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  @doc """
  Inserts a user into the database.

  ## Examples

        iex> user_params = %{email: "mike@gmail.com"}

        iex> {:ok, _struct} = Exmoveit.create_user(user_params)

  """
  defdelegate create_user(params), to: UsersCreate, as: :call
end
