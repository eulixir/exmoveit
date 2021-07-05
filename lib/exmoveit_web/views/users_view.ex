defmodule ExmoveitWeb.UsersView do
  use ExmoveitWeb, :view

  def render("create.json", %{user: user}) do
    %{
      message: "User created successfully",
      user: %{
        id: user.id,
        email: user.email,
        name: user.name,
        image: user.image
      }
    }
  end

  def render("show_all_users.json", %{users: users}), do: %{users: users}

  def render("show_user.json", %{user: user}) do
    %{
      user: %{
        name: user.name,
        email: user.email,
        image: user.image,
        id: user.id,
        profile_data: %{
          current_level: user.profile_data.current_level,
          current_experience: user.profile_data.current_experience,
          tasks_completed: user.profile_data.tasks_completed
        }
      }
    }
  end
  def render("show_best_moviters.json", %{best_moviters: best_moviters}), do: %{best_moviters: best_moviters}

end
