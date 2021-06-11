defmodule Exmoveit.Factory do
  @moduledoc """
    false
  """
  use ExMachina.Ecto, repo: Exmoveit.Repo

  alias Exmoveit.User

  def user_params_factory do
    %{
      "name" => "Jp",
      "email" => "jp@banana.com",
      "image" => "src/banana"
    }
  end

  def user_factory do
    %User{
      name: "Jp",
      email: "jp@banana.com",
      image: "src/banana"
    }
  end
end
