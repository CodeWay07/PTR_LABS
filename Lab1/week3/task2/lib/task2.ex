defmodule Task2 do
  def modifier do
    rand_number = :rand.uniform(10)
    receive do
      message when is_integer(message) ->
        mes = message + rand_number
        IO.puts("Received: " <> to_string(mes))
      message when is_bitstring(message) ->
        mes = String.upcase(message)
        IO.puts("Received: "  <> to_string(mes))
      message ->
        IO.puts("No way!")
    end
   modifier()
  end
end

#pid = spawn(Task2, :modifier, [])
