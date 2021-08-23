defmodule Exmoveit.ProfileData.CreateTest do
  @moduledoc false
  use Exmoveit.DataCase, async: true

  import Exmoveit.Factory

  alias Exmoveit.{Error, User}

  describe "call/1" do
    test "When id exists, create the profile data" do
      params = build(:user_params)

      {:ok, %User{id: id}} = Exmoveit.create_user(params)

      {:ok, response} = Exmoveit.create_profile_data(%{user_id: id})

      assert %Exmoveit.ProfileData{
               id: _id,
               current_experience: 0,
               current_level: 1,
               tasks_completed: 0,
               user_id: _user_id
             } = response
    end

    test "When the email already registered, returns an error" do
      :user_params
      |> build()
      |> Exmoveit.create_user()

      response =
        :user_params
        |> build()
        |> Exmoveit.create_user()

      assert {:error, %Error{}} = response
    end
  end
end
