# Learn:
# Keyword lists and maps
# Modules and Functions
# Recursion
# Enumerables and streams

# Submission 1: Lists, Maps, Reduce
# Given a phrase, count the occurrences of each word in that phrase.

# For example for the input "olly olly in come free"

# olly: 2
# in: 1
# come: 1
# free: 1

# Words are compared case-insensitively. The keys are lowercase.

defmodule Occurrence do
  @doc """
  Given a string, count the occurence of words.
  """
  @spec count_occ(String.t) :: map
  def count_occ(sentence) do
    sentence = String.split(String.downcase(sentence)," ", trim: true)
    count_words = fn({k, v}, acc) ->
      Map.put(acc, k, Enum.count(v))
    end
    new = Enum.group_by(sentence,fn(word) -> word end) |> Enum.reduce(%{}, count_words)
    new
  end
end



res = Occurrence.count_occ("Olly Olly in the house")
IO.puts res
