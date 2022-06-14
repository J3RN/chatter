defmodule ChatterInfra.Mailer do
  @moduledoc """
  Allows the application to send email
  """

  use Swoosh.Mailer, otp_app: :chatter
end
