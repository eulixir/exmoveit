defmodule ExmoveitWeb.UsersController do
  use ExmoveitWeb, :controller

  alias Exmoveit.User
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  @spec create(Plug.Conn.t(), %{email: String.t()}) ::
          {:error, %{status: :bad_request, result: Ecto.Changeset.t()}}
          | {:ok, %User{}}
  @doc """
  Inserts an user into the database.
  """
  def create(conn, %{"email" => _email, "name" => _name, "image" => _image} = user) do
    with {:ok, %User{} = user} <- Exmoveit.create_user(user) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    else
      error -> error
    end
  end
end
