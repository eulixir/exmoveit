defmodule Exmoveit.ProfileData.GetTest do
  @moduledoc false
  use Exmoveit.DataCase, async: true

  import Exmoveit.Factory

  alias Exmoveit.{ProfileData, User}

  describe "by_id/1" do
    test "When id exists, return the profile data of the user" do
      {:ok, %User{id: user_id}} =
        :user_params
      |> build()
      |> Exmoveit.create_user()

      {:ok, %User{profile_data: %{id: id}}} = Exmoveit.get_user(user_id)

      {:ok, response} = Exmoveit.get_profile_data(id)

      assert %Exmoveit.ProfileData{
               id: ^id,
               current_experience: 0,
               current_level: 1,
               tasks_completed: 0,
               user_id: ^user_id
             } = response
    end

    test "When does't exists, return an error" do
      response = Exmoveit.get_profile_data("1d84af18-1ac0-4ee8-b238-c4d523e379a9")

      assert {:error, %Exmoveit.Error{result: "Profile data is not found", status: :not_found}} == response
    end
  end

  describe "get_profile_id_by_email/1" do
    test "When email exists, return the id" do
      {:ok, %User{email: email}} =
        :user_params
      |> build()
      |> Exmoveit.create_user()
      response = Exmoveit.get_profile_id_by_email(email)

      {:ok, %ProfileData{id: id}} = Exmoveit.get_profile_data(response)

      assert response == id
    end

    test "When does't exists, return an error" do
      response = Exmoveit.get_profile_id_by_email("jp@banana.com")

      assert %Exmoveit.Error{result: "User not found", status: :not_found} == response
    end
  end
end
