defmodule Exmoveit.UsersControllerTest do
  @moduledoc """
    false
  """
  use ExmoveitWeb.ConnCase, async: true

  import Exmoveit.Factory

  describe "create/2" do
    test "When all params are valid, creates a user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      %{"user" => %{"id" => id}} = response

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "email" => "jp@banana.com",
                 "id" => ^id,
                 "image" => "src/banana",
                 "name" => "Jp"
               }
             } = response
    end

    test "When there are a email in database, returns an ok", %{conn: conn} do
      params = build(:user_params)

      conn
      |> post(Routes.users_path(conn, :create, params))
      |> json_response(:created)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:ok)

      expected_response = %{"message" => %{"email" => ["has already been taken"]}}

      assert response == expected_response
    end

    test "When there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: "Jp",
        image: "src/banana"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"email" => ["can't be blank"]}}

      assert response == expected_response
    end
  end

  describe "show_all" do
    test "When there are existing user, return a list of users", %{conn: conn} do
      :user_params
      |> build()
      |> Exmoveit.create_user()

      response =
        conn
        |> get(Routes.users_path(conn, :show_all))
        |> json_response(:ok)

      assert %{
               "users" => [
                 %{
                   "email" => "jp@banana.com",
                   "id" => _id,
                   "image" => "src/banana",
                   "name" => "Jp"
                 }
               ]
             } = response
    end

    test "When there are't existing user, return an empty list", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show_all))
        |> json_response(:ok)

      assert %{"users" => []} = response
    end
  end

  describe "by_id/1" do
    test "When id existis, return the user", %{conn: conn} do
      {:ok, user} =
        :user_params
        |> build()
        |> Exmoveit.create_user()

      id = user.id

      response =
        conn
        |> get(Routes.users_path(conn, :by_id, id))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "email" => "jp@banana.com",
                 "id" => ^id,
                 "image" => "src/banana",
                 "name" => "Jp",
                 "profile_data" => %{
                   "current_experience" => 0,
                   "current_level" => 1,
                   "tasks_completed" => 0
                 }
               }
             } = response
    end

    test "When id not exist, return an error", %{conn: conn} do
      id = "33622e8f-2659-4fb1-8218-1a51c90e5bad"

      response =
        conn
        |> get(Routes.users_path(conn, :by_id, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} == response
    end
  end

  describe "by_email/1" do
    test "When email existis, return the user", %{conn: conn} do
      {:ok, user} =
        :user_params
        |> build()
        |> Exmoveit.create_user()

      id = user.id
      email = user.email

      response =
        conn
        |> get(Routes.users_path(conn, :by_email, email))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "email" => "jp@banana.com",
                 "id" => ^id,
                 "image" => "src/banana",
                 "name" => "Jp",
                 "profile_data" => %{
                   "current_experience" => 0,
                   "current_level" => 1,
                   "tasks_completed" => 0
                 }
               }
             } = response
    end

    test "When id not exist, return an error", %{conn: conn} do
      email = "jp@banana.com"

      response =
        conn
        |> get(Routes.users_path(conn, :by_email, email))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} == response
    end
  end

  describe "update/1" do
    test "When id existis, return the user", %{conn: conn} do
      params = %{email: "jp@banana.com", name: "Jp", image: "src/banana"}
      {:ok, user} = Exmoveit.create_user(params)

      id = user.id
      email = user.email

      updated_params = %{email: email, image: "src/banana.jpeg"}

      response =
        conn
        |> put(Routes.users_path(conn, :update, updated_params))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "email" => "jp@banana.com",
                 "id" => ^id,
                 "image" => "src/banana.jpeg",
                 "name" => "Jp",
                 "profile_data" => %{
                   "current_experience" => 0,
                   "current_level" => 1,
                   "tasks_completed" => 0
                 }
               }
             } = response
    end

    test "When id not exist, return an error", %{conn: conn} do
      updated_params = %{email: "jp@banana.com", image: "src/banana.jpeg"}

      response =
        conn
        |> put(Routes.users_path(conn, :update, updated_params))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} == response
    end
  end
end
