defmodule ExmoveitWeb.ProfileDataController do
  use ExmoveitWeb, :controller

  alias Exmoveit.ProfileData
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  # @spec
  # false
  # """

  def update(conn, params) do
    IO.inspect(params)

    with {:ok, %ProfileData{} = profile_data} <- Exmoveit.update_profile_data(params) do
      conn
      |> put_status(:created)
      |> render("update.json", profile_data: profile_data)
    end
  end

  def show_by_email(conn, %{"email" => email}) do
    with id <- Exmoveit.get_profile_id_by_email(email) do
      {:ok, profile_data} = Exmoveit.get_profile_data(id)

      conn
      |> put_status(:created)
      |> render("show.json", profile_data: profile_data)
    end
  end
end
