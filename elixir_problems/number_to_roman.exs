# Write a function to convert from normal numbers to Roman Numerals.

# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programs.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

#  1  => I
# 10  => X
#  7  => VII


# I	1
# V	5
# X	10
# L	50
# C	100
# D	500
# M	1000
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the leftmost digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990.

# In Roman numerals 1990 is MCMXC:
# 1000=M 900=CM 90=XC
# 2008 is written as MMVIII:
# 2000=MM 8=VIII

# def num_to_roman(number) when number <= 3000, do

# end

defmodule Roman do
  @roman_to_decimal_mappings [M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    numeral([], number, @roman_to_decimal_mappings)
  end

  # While the number is >= the decimal value at the head of the mappings,
  # accumulate the Roman numeral and decrement the number
  defp numeral(roman_acc, number, [{roman_numeral, decimal_value}| _t] = roman_to_decimal_mappings)
      when number >= decimal_value do
    numeral([roman_numeral | roman_acc], number - decimal_value, roman_to_decimal_mappings)
  end

  # When the number is less than the decimal value at the head of the
  # mapping list, move to the next mapping pair
  defp numeral(roman_acc, number, [_h | remaining_mappings]) do
    numeral(roman_acc, number, remaining_mappings)
  end

  # And when the mapping list is exhausted, reverse the accumulated
  # Roman numerals and join then
  defp numeral(roman_acc, _n, [] = _remaining_mappings) do
    roman_acc
      |> Enum.reverse
      |> Enum.map_join("", &to_string/1)
  end
end

roman = Roman.numerals(4501)

IO.puts roman
