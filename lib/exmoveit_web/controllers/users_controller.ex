defmodule ExmoveitWeb.UsersController do
  use ExmoveitWeb, :controller

  alias Exmoveit.User
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  @spec create(Plug.Conn.t(), %{email: String.t(), image: String.t(), name: String.t()}) ::
          {:error, Error.build(:bad_request, Ecto.Changeset.t())}
          | {:ok, %User{}}
  @doc """
  Inserts an user into the database.
  """
  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmoveit.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
