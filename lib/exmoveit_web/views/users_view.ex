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
end
