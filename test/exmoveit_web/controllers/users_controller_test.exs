defmodule Exmoveit.UsersControllerTest do
  use ExmoveitWeb.ConnCase, async: true

  import Exmoveit.Factory

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      %{"user" => %{"user" => %{"id" => id}}} = response

      assert %{
               "user" => %{
                 "user" => %{
                   "name" => "Jp",
                   "email" => "jp@banana.com",
                   "image" => "src/banana",
                   "id" => ^id
                 }
               },
               "message" => "User created successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = build(:user_params)

      conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "There is already a user with this email address",
        "user" => %{"email" => "jp@banana.com", "new_user" => false}
      }

      assert response == expected_response
    end
  end
end
