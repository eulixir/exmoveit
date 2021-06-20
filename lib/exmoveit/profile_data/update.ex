defmodule Exmoveit.ProfilesData.Update do
  @moduledoc """
  false
  """
  alias Exmoveit.{ProfileData, Repo}

  def call(%{"email" => email} = params) do
    case Exmoveit.get_profile_id_by_email(email) do
      {:error, reason} ->
        {:error, reason}

      id ->
        id
        |> Exmoveit.get_profile_data()
        |> do_update(params)
    end
  end

  defp do_update({:ok, profile_data}, params) do
    profile_data
    |> ProfileData.changeset(params)
    |> Repo.update()
  end
end
