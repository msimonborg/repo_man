defmodule RepoManTest do
  use ExUnit.Case
  doctest RepoMan

  test "greets the world" do
    assert RepoMan.hello() == :world
  end
end
