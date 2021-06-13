# defmodule Exmoveit.ProfileData.Create do
#   @moduledoc """
#     Inserts a dataprofile into the database.
#   """
#   def call(%{} = params) do
#     params
#     |> User.changeset()
#     |> Repo.insert()
#     |> handle_insert()
#   end

#   def call(_anything), do: {:error, "Enter the data in a map format"}

#   defp handle_insert({:ok, %{}} = user), do: user

#   defp handle_insert({:error, result}) do
#     {:error, Error.build(:bad_request, result)}
#   end
# end
