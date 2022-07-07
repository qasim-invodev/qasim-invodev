defmodule StringFactor do
  @doc """
  Convert a number to a string, the contents of which depend on the number's factors.

  If the number has 3 as a factor, output 'Pling'.
  If the number has 5 as a factor, output 'Plang'.
  If the number has 7 as a factor, output 'Plong'.
  If the number does not have 3, 5, or 7 as a factor, just pass the number's digits straight through.

  Examples
  28's factors are 1, 2, 4, 7, 14, 28.
  In raindrop-speak, this would be a simple "Plong".

  The 30's factors are 1, 2, 3, 5, 6, 10, 15, 30.
  In raindrop-speak, this would be a "PlingPlang".

  34 has four factors: 1, 2, 17, and 34.
  In raindrop-speak, this would be "34".
  """
  @spec convert(num :: integer()) :: String.t()
  def convert(num) do
    l = for n <- 1..num do
      if rem(num,n) == 0 do
        cond do
          n == 3 -> "Pling"
          n == 5 -> "Plang"
          n == 7 -> "Plong"
          true -> ""
        end
      else
        ""
      end
    end
    s = Enum.join(l)
    _s = if String.length(s) == 0 do
      to_string(num)
    else
      s
    end
  end
end

str = StringFactor.convert(35)
IO.inspect str
