defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Activity
  alias Microblog.Activity.Follow

  def index(conn, _params) do
    follows = Activity.list_follows()
    render(conn, "index.html", follows: follows)
  end

  def new(conn, _params) do
    changeset = Activity.change_follow(%Follow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn,%{"follow" =>  %{"follower_id" => follower_id, "following_id" => following_id}}) do
    case Activity.create_follow(%{"follower_id" => follower_id, "following_id" => following_id}) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow created successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Activity.get_follow!(id)
    render(conn, "show.html", follow: follow)
  end

  def edit(conn, %{"id" => id}) do
    follow = Activity.get_follow!(id)
    changeset = Activity.change_follow(follow)
    render(conn, "edit.html", follow: follow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Activity.get_follow!(id)

    case Activity.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Activity.get_follow!(id)
    {:ok, _follow} = Activity.delete_follow(follow)

    conn
    |> put_flash(:info, "Follow deleted successfully.")
    |> redirect(to: follow_path(conn, :index))
  end
end
