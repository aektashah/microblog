defmodule Microblog.Activity.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Activity.Follow


  schema "follows" do
    belongs_to :following, Microblog.Accounts.User
    belongs_to :follower, Microblog.Accounts.User
    field :following_count, :integer
    field :follower_count, :integer 
   
    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:following_id, :follower_id, :following_count, :follower_count])
    |> validate_required([:following_id, :follower_id])
  end
end
