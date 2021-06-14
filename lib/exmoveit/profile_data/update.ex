defmodule Exmoveit.ProfilesData.Update do
  @moduledoc """
  false
  """
  alias Exmoveit.{ProfileData, Repo, User}

  def call(%{email: email} = params) do
    email
    |> Exmoveit.get_user_by_email()
    |> Exmoveit.get_user()
    |> fetch_profile_data(params)
  end

  def fetch_profile_data({:ok, user}, _params) do
    {:ok, profile_data} = Map.fetch(user, :profile_data)
  end

end
