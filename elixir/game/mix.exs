defmodule Game.Mixfile do
  use Mix.Project

  def project do
    [app: :game,
     version: "4.0.0",
     elixir: "~> 1.5",
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
