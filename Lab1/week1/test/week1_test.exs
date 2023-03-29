defmodule Week1Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "prints 'Hello PTR'" do
    assert capture_io(fn -> Week1.hello() end) == "Hello PTR\n"
  end
end
