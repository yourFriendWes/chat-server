defmodule ChatCallback.Callback.Webhook do
  use ChatCallback.Callback

  def handle(message, state) do
    IO.puts "Webhook received:"
    IO.inspect message

    {:noreply, state}
  end
end
