defmodule Microblog.Repo.Migrations.AddMessageOwner do
  use Ecto.Migration

  def change do
    # Add user_id to message table
    alter table("messages") do
      remove :user
      add :user_id, references(:users)

      timestamps()
    end
  end
end
