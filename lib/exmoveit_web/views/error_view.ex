defmodule ExmoveitWeb.ErrorView do
  use ExmoveitWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset

  def render("error.json", %{result: %Changeset{} = changeset}) do
    translate_errors(changeset)
    |> handle_changeset_errors(changeset)
  end

  defp handle_changeset_errors(%{email: ["has already been taken"]}, changeset) do
    %{
      message: "There is already a user with this email address",
      user: %{
        email: changeset.changes.email,
        new_user: false
      }
    }
  end

  defp handle_changeset_errors(anything, _changeset) do
    %{errors: anything}
  end

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  defp translate_errors(%Changeset{} = changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
