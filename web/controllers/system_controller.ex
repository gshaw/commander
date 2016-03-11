defmodule Commander.SystemController do
  use Commander.Web, :controller

  # Application health check.  Should verify all major systems to confirm
  # system is running as expected.
  #
  # Returns OK if system is running correctly.
  def health(conn, _params) do
    # TODO: check database
    text conn, "OK"
  end

  # Raise an error to verify that exception tracking system is working.
  def error(_conn, _params) do
    raise "Test Exception"
  end

  # Return basic system information.
  def info(conn, _params) do
    info = %{
      now: Timex.DateTime.now |> Timex.format!("{ISO:Extended:Z}"),
      elixir: System.version,
      erlang: to_string(:erlang.system_info(:otp_release))
    }
    json conn, info
  end

  # Send test email.
  def email(_conn, _params) do
    raise "Not implemented yet"
  end
end
