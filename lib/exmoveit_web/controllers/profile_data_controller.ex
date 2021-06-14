defmodule ExmoveitWeb.ProfileDataController do
  use ExmoveitWeb, :controller

  alias Exmoveit.ProfileData
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  # @spec
  # false
  # """
  def put(conn, %{"email" => email} = params) do

    # with {:ok, %User{} = user} <- Exmoveit.create_user(params) do
    #   conn
    #   |> put_status(:created)
    #   |> render("create.json", user: user)
    # end
  end
end
