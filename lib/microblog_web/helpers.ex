defmodule Microblog.Helpers do

  def nav_active?(view, text) do
    if String.contains?(to_string(view), text) do
      "active"
    else
      ""
    end
  end

  def get_user(id) do
    Microblog.Accounts.get_user!(id)
  end 

end
