defmodule Microblog.Repo.Migrations.AddFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :following_id, references(:users)
      add :follower_id, references(:users)

      timestamps()
    end 

    create index(:follows, [:following_id])
    create index(:follows, [:follower_id])
  end
end
