defmodule Chatter.Registration do
  @moduledoc """
  Module for registering conversants.
  """

  import Ecto.Changeset
  alias Chatter.Conversant
  alias ChatterInfra.Repo

  @spec register_with_password(String.t(), String.t(), String.t(), String.t()) ::
          {:ok, Conversant.t()} | :error
  def register_with_password(username, email, password, password_confirmation) do
    conversant_changeset(username, email, password, password_confirmation)
    |> Repo.insert()
    |> case do
      {:ok, conversant} -> {:ok, conversant}
      {:error, _changeset} -> :error
    end
  end

  defp conversant_changeset(username, email, password, password_confirmation) do
    %Conversant{}
    |> cast(
      %{
        username: username,
        email: email,
        credential: %{password: password, password_confirmation: password_confirmation}
      },
      [:username, :email]
    )
    |> validate_required([:username, :email])
    |> cast_assoc(:credential, with: &password_changeset/2, required: true)
  end

  defp password_changeset(struct, params) do
    struct
    |> cast(params, [:password, :password_confirmation])
    |> validate_required([:password, :password_confirmation])
    |> validate_password_confirmation()
    |> put_pass_hash()
  end

  defp validate_password_confirmation(changeset) do
    validate_change(changeset, :password_confirmation, fn :password_confirmation, confirmation ->
      if get_field(changeset, :password) == confirmation do
        []
      else
        [password_confirmation: "password confirmation does not match"]
      end
    end)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(invalid), do: invalid
end
