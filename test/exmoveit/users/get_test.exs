defmodule Exmoveit.Users.GetTest do
  @moduledoc false
  use Exmoveit.DataCase, async: true

  import Exmoveit.Factory

  alias Exmoveit.{Error, User, Repo}

  describe "by_id/1" do
    test "When id exist, returns the user" do
      {:ok, user} =
        :user
        |> build()
        |> Repo.insert()

      id = user.id

      response = Exmoveit.get_user(id)

      assert {:ok, %User{id: ^id, name: "Jp", email: "jp@banana.com", image: "src/banana"}} =
               response
    end

    test "When id not exist, returns an error" do
      id = "33622e8f-2659-4fb1-8218-1a51c90e5bad"
      response = Exmoveit.get_user(id)

      assert response == {:error, %Error{result: "User not found", status: :not_found}}
    end
  end

  describe "get_all" do
    test "If there is a user, return a list" do
      {:ok, user} =
        :user
        |> build()
        |> Repo.insert()

      id = user.id

      response = Exmoveit.get_all_users()

      assert [%User{email: "jp@banana.com", id: ^id, image: "src/banana", name: "Jp"}] = response
    end
    test "When not have a user, return an enpity list" do

      response = Exmoveit.get_all_users()

      assert [] == response
    end
  end

  describe "by_email/1" do
    test "When email exist, return a id" do
      {:ok, user} =
        :user
        |> build()
        |> Repo.insert()

      id = user.id
      email = user.email

      response = Exmoveit.get_user_by_email(email)

      assert response == id
    end

    test "When email does not exist, return an error" do
      email = "jp@banana.com"

      response = Exmoveit.get_user_by_email(email)

      assert response == {:error, %Error{result: "User not found", status: :not_found}}
    end
  end

  describe "fetch_by_email/1" do
    test "When email exist, return an user" do
      {:ok, user} =
        :user
        |> build()
        |> Repo.insert()

      id = user.id
      email = user.email

      response = Exmoveit.fetch_by_email(email)

      assert {:ok, %User{id: ^id, name: "Jp", email: "jp@banana.com", image: "src/banana"}} =
               response
    end
    test "When email does not exist, return an error" do
      email = "jp@banana.com"

      response = Exmoveit.fetch_by_email(email)

      assert response == {:error, %Error{result: "User not found", status: :not_found}}
    end
  end
end
