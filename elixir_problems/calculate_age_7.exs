defmodule Age do
  @doc """
  Given an age in seconds, calculate how old someone would be on:

  Earth: orbital period 365.25 Earth days, or 31557600 seconds
  Mercury: orbital period 0.2408467 Earth years
  Venus: orbital period 0.61519726 Earth years
  Mars: orbital period 1.8808158 Earth years
  Jupiter: orbital period 11.862615 Earth years
  Saturn: orbital period 29.447498 Earth years
  Uranus: orbital period 84.016846 Earth years
  Neptune: orbital period 164.79132 Earth years
  So if you were told someone was 1,000,000,000 seconds old, you should be able to say that they're 31.69 Earth-years old.
  """
  @spec calculate(age :: String.t(), planet :: String.t()) :: String.t()
  def calculate(age,planet) do
    age = String.to_integer(age)
    earth = Float.round(age/31557600,2)
    cond do
      planet == "Earth" -> "#{earth} Earth years old"
      planet == "Mercury" -> "#{Float.round(earth/0.2408467,2)} Mercury years old"
      planet == "Venus" -> "#{Float.round(earth/0.61519726,2)} Venus years old"
      planet == "Mars" -> "#{Float.round(earth/1.8808158,2)} Mars years old"
      planet == "Jupiter" -> "#{Float.round(earth/11.862615,2)} Jupiter years old"
      planet == "Saturn" -> "#{Float.round(earth/29.447498,2)} Saturn years old"
      planet == "Uranus" -> "#{Float.round(earth/84.016846,2)} Uranus years old"
      planet == "Neptune" -> "#{Float.round(earth/164.79132,2)} Neptune years old"
      true -> "Not a valid planet"
    end
  end
end

age = Age.calculate("1000000000","Neptune")
IO.puts age
