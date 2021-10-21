defmodule Exmoveit.Users.Get do
  @moduledoc """
    Get a user from database.
  """
  alias Exmoveit.{Error, Repo, User}

  def get_all, do: Repo.preload(Repo.all(User), [:profile_data])

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, Repo.preload(user, [:profile_data])}
    end
  end

  def by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, Error.build_user_not_found_error()}
      %User{} = user -> user.id
    end
  end

  def fetch_by_email(email) do
    case by_email(email) do
      {:error, reason} -> {:error, reason}
      id -> by_id(id)
    end
  end
end
