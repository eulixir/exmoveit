defmodule ExmoveitWeb.FallbackController do
  use ExmoveitWeb, :controller

  alias Ecto.Changeset
  alias ExmoveitWeb.ErrorView

  def call(conn, {:error, %{status: status, result: %Changeset{} = changeset}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: changeset)
  end
end
