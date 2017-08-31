defmodule ChatCallback.Mixfile do
  use Mix.Project

  def project do
    [app: :chat_callback,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      mod: {ChatCallback, []},
      applications: [
        :logger,
        :chat_pubsub
      ]
    ]
  end

  defp deps do
    [
      {:chat_pubsub, in_umbrella: true}
    ]
  end
end