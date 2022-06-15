defmodule Chatter.Conversant do
  use Ecto.Schema

  schema("conversants") do
    field(:username, :string)
    field(:email, :string)

    has_one(:credential, Chatter.Credential)

    timestamps()
  end
end
