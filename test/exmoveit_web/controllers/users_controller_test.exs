defmodule Exmoveit.UsersControllerTest do
  @moduledoc """
    false
  """
  use ExmoveitWeb.ConnCase, async: true

  import Exmoveit.Factory

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
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

    test "when there are a email in database, returns an ok", %{conn: conn} do
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

    test "when there are invalid params, returns an error", %{conn: conn} do
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
end
