defmodule FirstProcess do
  def listen(second_pid) do
    Process.monitor(second_pid)
    receive do
      {:DOWN, _, :process, second_pid, _} ->
        IO.puts "The second actor has stopped"
    end
  end
end

defmodule SecondProcess do
  def listen do
    # something...
    receive do
      message ->
        if message == "shut down" do
          IO.puts "Second process has stoppped"
          Process.exit(self(), :normal)
        end
    end
  end
end

#pid = spawn(SecondProcess, :listen,[])
#spawn(FirstProcess,:listen, [pid])
#send(pid,"shut down")
