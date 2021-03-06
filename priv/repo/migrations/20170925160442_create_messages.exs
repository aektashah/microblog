defmodule Microblog.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user, :string
      add :post, :text
      add :hashtags, :string
      add :mentions, :string

      timestamps()
    end

  end
end
