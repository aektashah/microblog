defmodule Microblog.Repo.Migrations.RemoveOldFollows do
  use Ecto.Migration

  def up do
    drop table(:follows)
  end
end
