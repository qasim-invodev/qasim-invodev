defmodule Song do
  @doc """
  Write the famous song lyrics using recursion and pattern matching.

  """
  def lyrics(0) do
   IO.puts "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall."
  end

  def lyrics(num \\ 99) when is_integer(num) and num <= 99 do
    cond do
      num == 1 -> IO.puts "#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, no more bottles of beer on the wall.
"
      true -> IO.puts "#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{num-1} bottles of beer on the wall.
"
    end
    lyrics(num-1)
  end
end

Song.lyrics()
