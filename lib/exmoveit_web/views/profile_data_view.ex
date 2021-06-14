defmodule ExmoveitWeb.ProfileDataView do
  use ExmoveitWeb, :view

  alias Exmoveit.ProfileData

  def render("update.json", %{profile_data: %ProfileData{} = profile_data}) do
    %{
      message: "Updated successfully",
      profile_data: %{
        profile_data: profile_data
      }
    }
  end
end
