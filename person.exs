# First Module called Person and the Struct to handle arguments

defmodule Person do
  defstruct [
    first_name: nil,
    last_name: nil,
    birthday: nil,
    location: "home"
  ]
  #All these are Public Functions
  def full_name(%Person{first_name: first_name, last_name: last_name} = person) do
    "#{first_name} #{last_name}"
  end

  def age(%Person{birthday: birthday} = person) do
    days = Date.diff(Date.utc_today, birthday)
    days / 365.25
  end

  def toggle_location(%Person{location: "away"} = person) do
    person |> set_location("home")
  end

  def toggle_location(%Person{location: "home"} = person) do
    person |> set_location("home")
  end

  #Private Function:
  defp set_location(%Person{} = person, location) do
    IO.puts "#{person |> full_name}'s location is now #{location}"
    %{person | location: location}
  end

  #Inspect Person Module
  defimpl Inspect do
    def inspect(%Person{
      first_name: first_name,
      last_name: last_name,
      location: location,
      }, _) do
      "Person[#{first_name} #{last_name}, #{location}]"
    end
  end
end

#To Compile : c "person.exs", "." it creates a Elixir.Person.beam file that elixir understands in machine level language


#Summary : Functions not only differ by name, but also by the number of arguments that they take, as well as the pattern of those arguments.

#Structs are actually Maps with one extra key '__struct__', hence can be passed to Map functions

#Struct and Protocols: ~D[1996-03-28] this is also a struct that Elixir shows like this for better Readability
