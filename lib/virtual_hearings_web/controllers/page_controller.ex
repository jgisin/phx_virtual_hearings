defmodule VirtualHearingsWeb.PageController do
  use VirtualHearingsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
