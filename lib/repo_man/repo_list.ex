defmodule RepoMan.RepoList do
  @moduledoc false

  use GenStage
  alias RepoMan.WorkerSupervisor, as: Sup

  @name __MODULE__

  def start_link([]) do
    GenStage.start_link(@name, :ok, name: @name)
  end

  ## Callbacks

  def init(:ok) do
    repos =
      "repos.txt"
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(fn repo ->
        repo
        |> String.replace("https://github.com/", "")
        |> String.replace(~r/(?<=\w)( \| .*)/, "")
      end)

    {:producer, repos}
  end

  def handle_demand(demand, _state = []) when demand > 0 do
    shutdown_when_complete()
  end

  def handle_demand(demand, state) when demand > 0 do
    repos = Enum.take(state, demand)
    {:noreply, repos, Enum.drop(state, demand)}
  end

  defp shutdown_when_complete do
    case ConsumerSupervisor.count_children(Sup) do
      %{active: 0} ->
        System.halt(0)

      %{active: _} ->
        Process.sleep(100)
        shutdown_when_complete()
    end
  end
end

