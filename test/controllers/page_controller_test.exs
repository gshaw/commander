defmodule Commander.PageControllerTest do
  use Commander.ConnCase

  test "home page", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Incident Command Post"
  end

  test "about page", %{conn: conn} do
    conn = get conn, "/about"
    assert html_response(conn, 200) =~ "About Commander"
  end
end
