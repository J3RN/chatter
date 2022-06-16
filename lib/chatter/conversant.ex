defmodule Chatter.Conversant do
  @moduledoc """
  The primary user of the platform; someone joining to view or engage in
  conversations.
  """

  use Ecto.Schema

  schema("conversants") do
    field(:username, :string)
    field(:email, :string)

    has_one(:credential, Chatter.Credential)

    timestamps()
  end
end
