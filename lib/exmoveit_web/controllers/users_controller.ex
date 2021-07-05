defmodule ExmoveitWeb.UsersController do
  use ExmoveitWeb, :controller

  alias Exmoveit.User
  alias ExmoveitWeb.FallbackController

  action_fallback FallbackController

  # @spec create(Plug.Conn.t(), %{email: String.t(), image: String.t(), name: String.t()}) ::
  #         {:error, Error.build(:bad_request, Ecto.Changeset.t())}
  #         | {:ok, %User{}}
  # @doc """
  # Inserts an user into the database.
  # """
  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmoveit.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show_all(conn, _params) do
    with users <- Exmoveit.get_all_users() do
      conn
      |> put_status(:ok)
      |> render("show_all_users.json", users: users)
    end
  end

  def by_id(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Exmoveit.get_user(id) do
      conn
      |> put_status(:ok)
      |> render("show_user.json", user: user)
    end
  end

  def by_email(conn, %{"email" => email}) do
    with {:ok, %User{} = user} <- Exmoveit.fetch_by_email(email) do
      conn
      |> put_status(:ok)
      |> render("show_user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Exmoveit.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("show_user.json", user: user)
    end
  end

  def leaderboard(conn, _params) do
    with best_moviters <- Exmoveit.leaderboard do
      conn
      |> put_status(:ok)
      |> render("show_best_moviters.json", best_moviters: best_moviters)
    end
  end
end
