defmodule Chatter.Repo do
  use Ecto.Repo,
    otp_app: :chatter,
    adapter: Ecto.Adapters.Postgres

  @type id :: any
  @type model :: module

  @spec fetch(model, id) :: {:ok, struct} | :error
  def fetch(model, id) do
    case get(model, id) do
      nil -> :error
      struct -> {:ok, struct}
    end
  end
end
