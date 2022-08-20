defmodule Chatter.Authentication do
  @moduledoc """
  Module for authenticating conversants.
  """

  import Ecto.Query
  alias Chatter.Conversant
  alias ChatterInfra.Repo

  @spec authenticate?(String.t(), String.t()) :: bool()
  def authenticate?(email, password) do
    authenticate(email, password)
    |> Repo.transaction()
    |> case do
      {:ok, %{authenticated?: authenticated?}} -> authenticated?
      _ -> false
    end
  end

  defp authenticate(email, password) do
    Ecto.Multi.new()
    |> Ecto.Multi.one(:conversant, Conversant |> where(email: ^email) |> preload(:credential))
    |> Ecto.Multi.run(:authenticated?, fn _repo, %{conversant: conversant} ->
      {:ok, conversant && Argon2.verify_pass(password, conversant.credential.password_hash)}
    end)
  end
end
