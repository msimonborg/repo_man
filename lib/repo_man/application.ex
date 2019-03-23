defmodule RepoMan.Application do
  @moduledoc false

  use Application
  alias RepoMan.{RepoList, WorkerSupervisor}

  def start(_type, _args) do
    children = [
      RepoList,
      WorkerSupervisor
    ]

    opts = [strategy: :rest_for_one, name: RepoMan.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
