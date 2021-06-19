defmodule Exmoveit.Users.Get do
  @moduledoc """
    false
  """
  alias Exmoveit.{Error, Repo, User}

  def get_all, do: Repo.all(User)

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, Repo.preload(user, [:profile_data])}
    end
  end

  def by_email(email) do
    users = get_all()
    case Enum.find(users, fn map -> map.email == email end) do
      nil -> {:error, Error.build_user_not_found_error()}
      email -> email.id
    end
  end
end
