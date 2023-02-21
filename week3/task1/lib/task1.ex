defmodule Task1 do
  use GenServer

  #Client
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def print(pid, message) do
    GenServer.cast(pid, message)
  end

  def stop(pid) do
    GenServer.stop(pid)
  end

  #Server
  def terminate() do
    :ok
  end

  def handle_cast(message, _) do
    IO.puts(message)
    {:noreply, nil}
  end

  def init(message) do
    {:ok, message}
  end
end

# {:ok, pid} = Task1.start_link()
# Process.alive?(pid)
# Task1.print(pid, "")
# Task1.stop(pid)
