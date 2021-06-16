defmodule ExmoveitWeb.UsersView do
  use ExmoveitWeb, :view

  # alias Exmoveit.User

  def render("create.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      image: user.image,
      message: "banana"
    }
  end

  def render("show_all_users.json", %{users: users}) do
    render_many(users, __MODULE__, "create.json")
  end

  def render("show_user.json", %{user: user}) do
    render_one(user, __MODULE__, "create.json", %{user: user})
  end
end

# Vie: UserView do
#   use DoctorScheduleWeb, :view

#   def render("index.json", %{users: users}) do
#     render_many(users, MODULE, "user.json")
#   end

#   def render("show.json", %{user: user}) do
#     render_one(user, MODULE, "user.json")
#   end

#   def render("user.json", %{user: user}) do
#     %{
#       id: user.id,
#       email: user.email,
#       first_name: user.first_name,
#       last_name: user.last_name,
#       role: user.role
#     }
#   end
# end
