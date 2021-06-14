defmodule ExmoveitWeb.ProfileDataController do
  use ExmoveitWeb, :controller

  alias Exmoveit.ProfileData
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  # @spec
  # false
  # """

  def update(conn, params) do
    with {:ok, %ProfileData{} = profile_data} <- Exmoveit.update_profile_data(params) do
      conn
      |> put_status(:created)
      |> render("update.json", profile_data: profile_data)
    end
  end
end
