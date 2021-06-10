defmodule Exmoveit.Users.Create do
  @moduledoc """
    Inserts a user into the database.
  """

  alias Exmoveit.{Repo, User}

  @doc """
  Inserts a user into the database.

  ## Examples

        iex> user_params = %{email: "mike@gmail.com"}

        iex> {:ok, _struct} = Exmoveit.Users.Create.call(user_params)

  """
  def call(%{} = params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

end
