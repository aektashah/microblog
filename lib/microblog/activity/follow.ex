defmodule Microblog.Activity.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Activity.Follow


  schema "follows" do
    field :following_id, :id
    field :follower_id, :id
    field :following_count, :integer
    field :follower_count, :integer 

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [])
    |> validate_required([])
  end
end
