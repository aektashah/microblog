defmodule Microblog.Activity.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Activity.Like


  schema "likes" do
    belongs_to :message, Microblog.Blog.Message
    belongs_to :user, Microblog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:message_id, :user_id])
    |> validate_required([:message_id, :user_id])
  end
end
