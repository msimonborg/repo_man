defmodule RepoMan do
  @moduledoc """
  Bulk delete a list of github repos.
  """
  @token File.read!("token.txt")

  @doc """
  Read the `repos.txt` file for a list of repos and send a delete request
  for each one to the Github API.
  """
  def clean do
    "repos.txt"
    |> File.stream!()
    |> Stream.map(&trim_repo/1)
    |> Task.async_stream(&delete_repo/1)
    |> Stream.run()
  end

  defp trim_repo(repo) do
    repo
    |> String.replace("https://github.com/", "")
    |> String.replace(~r/(?<=\w)( \| .*)/, "")
    |> String.trim()
  end

  defp delete_repo(repo) do
    HTTPoison.delete!(
      "https://api.github.com/repos/#{repo}",
      [{"Authorization", "token #{@token}"}]
    )

    IO.puts("Deleted #{repo}")
  end
end
