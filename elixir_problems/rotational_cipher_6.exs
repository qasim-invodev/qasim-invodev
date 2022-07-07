# Create an implementation of the rotational cipher, also sometimes called the Caesar cipher.

# The Caesar cipher is a simple shift cipher that relies on transposing all the letters in the alphabet using an integer key between 0 and 26. Using a key of 0 or 26 will always yield the same output due to modular arithmetic. The letter is shifted for as many values as the value of the key.

# The general notation for rotational ciphers is ROT + <key>. The most commonly used rotational cipher is ROT13.

# A ROT13 on the Latin alphabet would be as follows:

# Plain:  abcdefghijklmnopqrstuvwxyz
# Cipher: nopqrstuvwxyzabcdefghijklm
# It is stronger than the Atbash cipher because it has 27 possible keys, and 25 usable keys.

# Ciphertext is written out in the same formatting as the input including spaces and punctuation.

# Examples
# ROT5 omg gives trl
# ROT0 c gives c
# ROT26 Cool gives Cool
# ROT13 The quick brown fox jumps over the lazy dog. gives Gur dhvpx oebja sbk whzcf bire gur ynml qbt.
# ROT13 Gur dhvpx oebja sbk whzcf bire gur ynml qbt. gives The quick brown fox jumps over the lazy dog.


defmodule Rotation do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> Rotation.cipher("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec cipher(sentence :: String.t(), shift :: integer) :: String.t()
  def cipher(sentence, shift) when is_integer(shift) and shift <= 26 do
    sentence
    |> String.to_charlist()
    |> Enum.map(fn char -> cond do
      char == 32 -> char
      char >= 97 and char <= 122 -> 97 + rem(char - 71 + shift,26)
      char >= 65 and char <= 90 -> 65 + rem(char - 39 + shift,26)
      true -> ''
      end
    end)
    |> to_string()
  end
end

encode = Rotation.cipher("*Qasim is here to help",13)
IO.puts encode
