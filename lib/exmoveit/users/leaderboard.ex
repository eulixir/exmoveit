defmodule Exmoveit.Users.Leaderboard do
  import Ecto.Query

  alias Exmoveit.{Repo, User}

  def call do
    query = from u in User,
           limit: 10,
           join: p in assoc(u, :profile_data),
           order_by: [desc: [p.current_level, p.tasks_completed, p.current_experience]],
           preload: [profile_data: p]

    Repo.all(query)
  end
end
