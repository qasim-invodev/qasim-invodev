defmodule DNA do
  @doc """
  Convert the DNA to RNA.
  DNA Strands and RNA Replacements
  G -> C
  C -> G
  T -> A
  A -> U

  """
  @spec dna_converter(String.t) :: String.t()
  def dna_converter(dna) do
    dna = String.split(dna,"",trim: true)
    rna = Enum.map(dna, fn dna_strand -> cond do
      dna_strand == "A" -> "U"
      dna_strand == "T" -> "A"
      dna_strand == "C" -> "G"
      dna_strand == "G" -> "C"
      true -> nil
      end
    end)
    rna = Enum.join(rna,"")
    rna
  end
end

rna = DNA.dna_converter("GACT ")
IO.puts rna
