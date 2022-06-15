defmodule Chatter.Conversant do
  use Ecto.Schema

  schema("conversant") do
    field(:username, :string)

    has_one(:credential, Chatter.Credential)
  end
end
