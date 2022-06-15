defmodule Chatter.Credential do
  use Ecto.Schema

  schema("credentials") do
    field(:password_hash, :string)

    # Generally speaking, I would prefer to have credentials be polymorphic such
    # that they can be composed with other schemas to allow sign-in. However,
    # that would incur some complexity cost, so we'll cross that bridge if/when
    # we come to it.
    belongs_to(:conversant, Chatter.Conversant)
  end
end
