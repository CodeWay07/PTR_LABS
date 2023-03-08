import Enum

defmodule Week2 do

 # Write a function that determines whether an input integer is prime
  def isPrime(n) when n <= 1, do: false
  def isPrime(2), do: true
  def isPrime(n) do
   !any?(2..round(:math.sqrt(n)), &(rem(n, &1) == 0))
  end

 # Write a function to calculate the area of a cylinder, given it’s height and radius
  def cylinderArea(height, radius) do
   2* :math.pi * radius * (height + radius)
  end

  # Write a function to calculate the area of a cylinder, given it’s height and radius
  def reverse(list) do
   Enum.reverse(list)
  end

  # Write a function to calculate the sum of unique elements in a list.
  def uniqueSum(list) do
    sum(Enum.uniq(list))
  end

  # Write a function that extracts a given number of randomly selected elements from a list
  def extractRandomN(list, n) do
    take_random(list, n)
  end

  # Write a function that returns the first n elements of the Fibonacci sequence
  def fib(0) do 0 end
  def fib(1) do 1 end
  # def fib(n) do fib(n-1) + fib(n-2) end

  def fib(n) do
    seq = []
    for n <- 0..n-1 do
      List.insert_at(seq, -1, (fib(n-1) + fib(n-2)))
    end
  end

  # Write a function that, given a dictionary, would translate a sentence. Words not found in the dictionary need not be translated.
  def translator(dict, str) do
    str
    |> String.split(" ")
    |> map(fn word -> Map.get(dict, String.to_atom(word), word) end)
    |> join(" ")
  end

  # Write a function that receives as input three digits and arranges them in an order that would create the smallest possible number. Numbers cannot start with a 0
  def smallestNumber(a, b, c) do
    list = [a, b, c]
    list = sort(list)
    if List.first(list) == 0 do
      if at(list, 1) == 0 do
        [at(list, 2), 0, 0]
      else
        [at(list, 1), 0, at(list, 2)]
      end
    else
      list
    end
  end
  #   Week2.smallestNumber(4, 7, 2)


  # Write a function that would rotate a list n places to the left
  def rotateLeft(list, 0), do: list

  def rotateLeft(list, n) when n > 0 do
    [first | last] = list
    rotateLeft(last ++ [first], n - 1)
  end
  #   Week2.rotateLeft([1, 2, 3, 4, 5], 2)

  # Write a function that lists all tuples a, b, c such that a2+b2 = c2 and a, b ≤ 20
  def listRightAngleTriangles() do
    for a <- 1..20, b <- 1..20,
    c = :math.floor(:math.sqrt(a*a + b*b)),
    c*c == a*a + b*b, do: {a, a, c}
  end
  #   Week2.listRightAngleTriangles()


  #  Write a function that eliminates consecutive duplicates in a list.
  def removeConsecutiveDuplicates(list) do
    Enum.dedup(list)
  end
  #   Week2.removeConsecutiveDuplicates([1, 2, 2, 2, 3, 5, 6, 7, 7])

end
