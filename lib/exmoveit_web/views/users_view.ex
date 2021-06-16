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
    render_one(user, __MODULE__, "user.json", %{user: user})
  end
end
