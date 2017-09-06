defmodule ChatCallback.CallbackSupervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, name: (opts[:name] || __MODULE__))
  end

  def init(:ok) do
    supervise([
      worker(ChatCallback.Callback, [], restart: :transient)
    ], strategy: :simple_one_for_one)
  end

  def start_callback(record) do
    Supervisor.start_child(__MODULE__, [record])
  end
end