defmodule Exmoveit.Users.Update do
  @moduledoc """
  false
  """
  alias Exmoveit.{Repo, User}

  def call(%{"email" => email} = params) do
    case Exmoveit.get_user_by_email(email) do
      {:error, reason} -> {:error, reason}
      id -> do_update(id, params)
    end
  end

  defp do_update(id, params) do
    User
    |> Repo.get(id)
    |> Repo.preload([:profile_data])
    |> User.changeset(params)
    |> Repo.update()

  end
end
