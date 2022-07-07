# Given a number n, determine what the nth prime is.
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# If your language provides methods in the standard library to deal with prime numbers, pretend they don't exist and implement them yourself.

defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0) do
    raise("error")
  end
  def nth(count) do
    Stream.iterate(1, &(&1+1))
    |> Stream.filter(&is_prime(&1))
    |> Enum.take(count)
    |> List.last
  end
  def is_prime(n) when n < 2 do
    false
  end
  def is_prime(n) when n == 2 do
    true
  end
  def is_prime(n) do
    end_num = :math.sqrt(n) |> round
    cond do
      Enum.any?(Enum.map(2..end_num, fn(t) -> rem(n, t) == 0 end )) -> false
      true -> true
    end
  end
end
prime = Prime.nth(6)
IO.inspect prime
