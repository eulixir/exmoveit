defmodule Exmoveit.ProfilesData.Get do
  @moduledoc false
  alias Exmoveit.{Error, ProfileData, Repo}

  def by_id(id) do
    case Repo.get(ProfileData, id) do
      nil -> {:error, Error.build_profile_data_not_found_error()}
      profile_data -> {:ok, Repo.preload(profile_data, [:user])}
    end
  end

  def get_profile_id_by_email(email) do

    case Exmoveit.get_user_by_email(email) do
      {:error, reason} ->
        reason

        id ->
          id
          |> Exmoveit.get_user()
          |> fetch_profile_data()
    end
  end

  defp fetch_profile_data({:ok, user}) do
    {:ok, profile_data} = Map.fetch(user, :profile_data)
    profile_data.id
  end
end
