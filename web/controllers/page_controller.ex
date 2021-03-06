defmodule ExDebugToolbarDemo.PageController do
  use ExDebugToolbarDemo.Web, :controller
  import Ecto.Query
  alias ExDebugToolbarDemo.User
  require ExDebugToolbar

  def index(conn, _params) do
    render conn, "index.html", page_header: "Simple"
  end

  def ecto(conn, _params) do
    User |> preload([:videos, :articles]) |> where(id: 1) |> Repo.all
    conn
    |> assign(:page_header, "Ecto")
    |> render("ecto.html")
  end

  def partials(conn, _params) do
    render conn, "partials.html", page_header: "Partials"
  end

  def pry(conn, _params) do
    ExDebugToolbar.pry
    render conn, "pry.html", page_header: "Pry"
  end
end
