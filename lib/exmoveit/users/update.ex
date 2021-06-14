defmodule Exmoveit.Users.Update do
  @moduledoc """
  false
  """
  alias Exmoveit.{Error, Repo, User}

  def call(%{email: email} = params) do
    id = Exmoveit.get_user_by_email(email)

    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
