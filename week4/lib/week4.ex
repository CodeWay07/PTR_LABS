<<<<<<< HEAD
import Supervisor
import Enum

defmodule Lab.WorkersPool do
  def start_group() do
    w_list = [Worker1, Worker2, Worker3]

    children = for w_name <- w_list do
      %{id: w_name, start: {Lab.WorkersPool.WorkerNode, :start_link, [w_name]}}
    end

    {:ok, supervisor_pid} = start_link(children, strategy: :one_for_one)
    worker_pids = Supervisor.which_children(supervisor_pid) |> Enum.map(&elem(&1, 1))
    {supervisor_pid, worker_pids}
  end
end

defmodule Lab.WorkersPool.WorkerNode do
  def start_link(w_name) do
    pid = spawn_link(fn -> loop(w_name) end)
    {:ok, pid}
  end

  def loop(w_name) do
    receive do
      {:kill} ->
        Process.flag(:trap_exit, true)
        exit(:stop)

      {:message, message} ->
        message |> IO.puts()
        loop(w_name)
    end
  end

  def message(pid, message) do
    send(pid, {:message, message})
  end

  def kill(pid) do
    send(pid, {:kill})
  end
end

## {supervisor_pid, pids} = Lab.WorkersPool.start_group()
## Lab.WorkersPool.WorkerNode.message(Enum.at(pids, 1), "Hi, Alex!")
## Lab.WorkersPool.WorkerNode.kill(Enum.at(pids, 2))
## workers = Supervisor.which_children(supervisor_pid)
=======
defmodule Week4 do
  @moduledoc """
  Documentation for `Week4`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Week4.hello()
      :world

  """
  def hello do
    :world
  end
end
>>>>>>> 65cee42f6ac84b059a2cbb8b8e8e0023fd9c431b
