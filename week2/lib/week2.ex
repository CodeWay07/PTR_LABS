import Enum

defmodule Week2 do
  def hello do
    "Hello World!"
  end

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

  def first(n) do
    seq = []
    for n <- 0..n-1 do
      List.insert_at(seq, -1, (fib(n-1) + fib(n-2)))
    end
  end

  # Write a function that, given a dictionary, would translate a sentence. Words not found in the dictionary need not be translated.


end
