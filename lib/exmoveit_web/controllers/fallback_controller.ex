defmodule ExmoveitWeb.FallbackController do
  use ExmoveitWeb, :controller

  alias Exmoveit.Error
  alias ExmoveitWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
