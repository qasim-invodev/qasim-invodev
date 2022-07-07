defmodule Scrabble do
  @doc """
  Given a word, compute the scrabble score for that word.

  Letter Values
  You'll need these:

  Letter                                   Value
  A, E, I, O, U, L, N, R, S, T       1
  D, G                                        2
  B, C, M, P                               3
  F, H, V, W, Y                           4
  K                                            5
  J, X                                        8
  Q, Z                                      10
  Examples
  "cabbage" should be scored as worth 14 points:

  3 points for C
  1 point for A, twice
  3 points for B, twice
  2 points for G
  1 point for E
  And to total:

  3 + 2*1 + 2*3 + 2 + 1
  = 3 + 2 + 6 + 3
  = 5 + 9
  = 14
  """
  @spec score(word :: String.t()) :: integer()
  def score(word) when is_binary(word) do
    word
    |> String.upcase()
    |> String.split("",trim: true)
    |> Enum.reduce(0,fn alphabet, score ->
      cond do
        alphabet in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] -> score + 1
        alphabet in ["D","G"] -> score + 2
        alphabet in ["B", "C", "M", "P"] -> score + 3
        alphabet in ["F", "H", "V", "W", "Y"] -> score + 4
        alphabet in ["K"] -> score + 5
        alphabet in ["J", "X"] -> score + 8
        alphabet in ["Q", "Z"] -> score + 10
      end
    end)
  end
end

score = Scrabble.score("balled")
IO.puts score
