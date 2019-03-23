defmodule RepoMan.WorkerSupervisor do
  @moduledoc false

  use ConsumerSupervisor
  alias RepoMan.{Worker, RepoList}

  def start_link([]) do
    ConsumerSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  ## Callbacks

  def init(:ok) do
    children = [
      Worker
    ]

    opts = [
      strategy: :one_for_one,
      subscribe_to: [{RepoList, max_demand: 10}]
    ]

    ConsumerSupervisor.init(children, opts)
  end
end
