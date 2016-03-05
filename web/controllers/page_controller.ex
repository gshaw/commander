defmodule Commander.PageController do
  use Commander.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
