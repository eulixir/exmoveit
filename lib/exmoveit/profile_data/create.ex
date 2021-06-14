defmodule Exmoveit.ProfilesData.Create do
  @moduledoc """
    Inserts a data profile into the database.

  """

  alias Exmoveit.{Error, ProfileData, Repo}

  def call(%{} = params) do
    params
    |> ProfileData.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def call(_anything), do: {:error, "Enter the data in a map format"}

  defp handle_insert({:ok, %{}} = profile_data), do: profile_data

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
