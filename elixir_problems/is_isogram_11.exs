defmodule Isogram do
  @doc """
  Determine if a word or phrase is an isogram.
  An isogram (also known as a "non pattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.
  Examples of isograms:
  lumberjacks
  background
  downstream
  six-year-old
  The word isograms, however, is not an isogram, because the s repeats.
  """
  @spec check?(sentence::String.t()) :: boolean()
  def check?(sentence) do
    string_split =
      sentence
      |> String.replace(~r/[- ]/, "")
      |> String.downcase()
      |> String.split("", trim: true)
    string_split_unique = Enum.uniq(string_split)
    Kernel.length(string_split) == Kernel.length(string_split_unique)
  end
end

IO.inspect(Isogram.check?("QasimNo-A"))
