defmodule RepoMan.Worker do
  @moduledoc false

  use Task

  @token File.read!("token.txt")

  def start_link([], repo) do
    Task.start_link(__MODULE__, :delete, [repo])
  end

  def delete(repo) do
    HTTPoison.delete!("https://api.github.com/repos/#{repo}", [{"Authorization", "token #{@token}"}])
    IO.puts("Deleted #{repo}")
  end
end
