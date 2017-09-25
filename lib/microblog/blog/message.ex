defmodule Microblog.Blog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Message


  schema "messages" do
    field :hashtags, :string
    field :mentions, :string
    field :post, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:user, :post, :hashtags, :mentions])
    |> validate_required([:user, :post, :hashtags, :mentions])
  end
end
