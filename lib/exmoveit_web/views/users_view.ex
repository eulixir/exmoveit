defmodule ExmoveitWeb.UsersView do
  use ExmoveitWeb, :view

  alias Exmoveit.User

  def render("create.json", %{user: %User{email: email, name: name, image: image}}) do
    %{
      message: "User created successfully",
      user: %{
        email: email,
        new_user: true,
        name: name,
        image: image
      }
    }
  end
end
