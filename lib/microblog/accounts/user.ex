defmodule Microblog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.User


  schema "users" do
    field :email, :string
    has_many :messages, Microblog.Blog.Message
    has_many :following, Microblog.Activity.Follow, foreign_key: :following_id
    has_many :follower, Microblog.Activity.Follow

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
