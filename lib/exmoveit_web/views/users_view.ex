defmodule ExmoveitWeb.UsersView do
  use ExmoveitWeb, :view

  alias Exmoveit.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created successfully",
      user: %{
        user: user
      }
    }
  end

  def render("show_all_users.json", %{users: [%User{} | _tail] = users}), do: %{users: users}
end
