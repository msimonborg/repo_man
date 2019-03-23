defmodule RepoMan.MixProject do
  use Mix.Project

  def project do
    [
      app: :repo_man,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RepoMan.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_stage, "~> 0.14.1"},
      {:httpoison, "~> 1.5"}
    ]
  end
end
