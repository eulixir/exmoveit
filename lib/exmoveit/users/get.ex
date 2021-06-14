defmodule Exmoveit.Users.Get do
   @moduledoc """
    false
  """
  alias Exmoveit.{Error, Repo, User}

  def get_all do
    User
    |> Repo.all()
  end

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, Repo.preload(user, [:profile_data])}
    end
  end
end
