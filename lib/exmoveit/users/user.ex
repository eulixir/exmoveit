defmodule Exmoveit.Users.Create do
  @moduledoc """
    Inserts a user into the database.
  """

  alias Exmoveit.{Repo, User}

  @spec call(%{email: String.t()}) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
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

  def call(_anything), do: "Enter the data in a map format"
end
