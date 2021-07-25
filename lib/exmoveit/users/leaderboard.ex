defmodule Exmoveit.Users.Leaderboard do
  @moduledoc """
  false
  """
  import Ecto.Query

  alias Exmoveit.{Repo, User}

  def call do
    query =
      from u in User,
        limit: 10,
        join: p in assoc(u, :profile_data),
        order_by: [desc: [p.current_level, p.tasks_completed, p.current_experience]],
        preload: [profile_data: p]

    best_moviters = Repo.all(query)
    best_moviters = Enum.map(best_moviters, fn x -> Map.put(x, :banana, 1..10) end)
    best_moviters
  end
end
