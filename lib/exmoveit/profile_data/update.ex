defmodule Exmoveit.ProfilesData.Update do
  @moduledoc """
  false
  """
  alias Exmoveit.{ProfileData, Repo}

  def call(%{email: email} = params) do
    case Exmoveit.get_user_by_email(email) do
      {:error, reason} -> reason
      id -> id
      |> Exmoveit.get_user()
      |> fetch_profile_data(params)
    end
  end

  defp fetch_profile_data({:ok, user}, params) do
    {:ok, profile_data} = Map.fetch(user, :profile_data)
    do_update(profile_data, params)
  end

  defp do_update(profile_data, params) do
    profile_data
    |> ProfileData.changeset(params)
    |> Repo.update()
  end
end
