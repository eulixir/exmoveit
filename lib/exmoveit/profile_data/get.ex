defmodule Exmoveit.ProfilesData.Get do
  @moduledoc false
  alias Exmoveit.{Error, ProfileData, Repo}

  def by_id(id) do
    case Repo.get(ProfileData, id) do
      nil -> {:error, Error.build_profile_data_not_found_error()}
      profile_data -> {:ok, Repo.preload(profile_data, [:user])}
    end
  end
end
