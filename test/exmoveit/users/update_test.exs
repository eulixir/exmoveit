defmodule Exmoveit.Users.UpdateTest do
  @moduledoc false
  use Exmoveit.DataCase, async: true

  import Exmoveit.Factory

  alias Exmoveit.{Error, User}

  describe "call/1" do
    test "when all params are valid, update the user" do
      user =
        :user_params
        |> build()
        |> Exmoveit.create_user()

      {:ok, %User{email: email}} = user

      updated_params = %{"email" => email, "image" => "src/banana_nanica"}

      response = Exmoveit.update_user(updated_params)

      assert {:ok, %User{id: _id, name: "Jp", email: "jp@banana.com", image: "src/banana_nanica"}} =
               response
    end

    test "when email not exist, returns an error" do
      params = %{"email" => "jp@banana.com", "image" => "src/banana_nanica"}

      response = Exmoveit.update_user(params)

      expected_response = {:error, %Error{result: "User not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
