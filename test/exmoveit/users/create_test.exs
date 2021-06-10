defmodule Exmoveit.Users.CreateTest do
  use Exmoveit.DataCase, async: true

  import Exmoveit.Factory

  alias Exmoveit.{Error, User, Users.Create}

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, name: "Jp", email: "jp@banana.com", image: "src/banana"}} =
               response
    end

    test "when there the email already registered, returns an error" do
      :user_params
      |> build()
      |> Create.call()

      response =
        :user_params
        |> build()
        |> Create.call()

        assert {:error, %Error{}} = response

      # assert {:error, %Error{status: :bad_request, result: changeset}} = response
      # assert errors_on(changeset) == expected_response
    end
  end
end
