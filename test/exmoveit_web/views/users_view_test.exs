defmodule ExmoveitWeb.UsersViewWeb do
  use ExmoveitWeb.ConnCase, async: true

  import Phoenix.View
  import Exmoveit.Factory

  alias Exmoveit.Repo
  alias ExmoveitWeb.UsersView

  test "Renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created successfully",
             user: %{
               email: "jp@banana.com",
               id: nil,
               image: "src/banana",
               name: "Jp"
             }
           } = response
  end

  test "Renders show_all_users.json" do
    :user
    |> build()
    |> Repo.insert()

    users = Exmoveit.get_all_users()

    response = render(UsersView, "show_all_users.json", users: users)

    assert %{
             users: [
               %Exmoveit.User{
                 email: "jp@banana.com",
                 id: _id,
                 image: "src/banana",
                 name: "Jp"
               }
             ]
           } = response
  end

  test "Renders show_user.json" do
    {:ok, user} =
      :user
      |> build()
      |> Repo.insert()

    id = user.id

    {:ok, user} = Exmoveit.get_user(id)

    response = render(UsersView, "show_user.json", user: user)

    assert %{
             user: %Exmoveit.User{
               email: "jp@banana.com",
               id: ^id,
               image: "src/banana",
               name: "Jp"
             }
           } = response
  end
end
