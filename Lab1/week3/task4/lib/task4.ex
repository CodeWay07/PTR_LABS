defmodule Task4 do
  def averager(n1, n2) do
    receive do
      num when is_number(num) ->
        sum = n1+n2
        average = sum/num
        IO.puts("Current average is #{average}")
    end
    averager(n1, n2)
  end
end

#pid = spawn(Task4, :averager, [5, 16])
#send(pid, 2)
