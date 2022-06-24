# We are gonna use our person module with People project we created with Mix

# Few Important Points:
# Now Person module will have People. project in it.
# Methods will be passed a %__MODULE__{} instead of a %Person so that Module object can be written in a short way in Elixir

defmodule People.Person do
  defstruct first_name: nil,
            last_name: nil,
            birthday: nil,
            location: "home"

  # All these are Public Functions

  @doc """
  Joins together a person's first name and last name.
  If that person only has a first name, then will only show that name.

  ## Examples

  iex> ryan = %Person{first_name: "Ryan", last_name: "Bigg"}
  iex> ryan |> Person.full_name
  "Ryan Bigg"

  iex> madonna = %Person{first_name: "Madonna"}
  iex> madonna |> Person.full_name
  "Madonna"
  """
  def full_name(%__MODULE__{
    first_name: first_name,
    last_name: nil
  }) do
    "#{first_name}"
  end

  def full_name(%__MODULE__{
    first_name: first_name,
    last_name: last_name
  }) do
    "#{first_name} #{last_name}"
  end

  @doc """
  Calculate a person's age if birthday is available

  ## Examples

  iex> madonna = %Person{birthday: ~D[1996-03-28]}
  iex> madonna |> Person.age
  26.239561943874058
  """
  def age(%__MODULE__{} = person) do
    days = Date.diff(Date.utc_today(), person.birthday)
    days / 365.25
  end

  def toggle_location(%__MODULE__{location: "away"} = person) do
    person |> set_location("home")
  end

  def toggle_location(%__MODULE__{location: "home"} = person) do
    person |> set_location("home")
  end

  # Private Function:
  defp set_location(%__MODULE__{} = person, location) do
    IO.puts("#{person |> full_name}'s location is now #{location}")
    %{person | location: location}
  end

  # Inspect Person Module
  defimpl Inspect do
    def inspect(
          %{
            first_name: first_name,
            last_name: last_name,
            location: location
          },
          _
        ) do
      "Person[#{first_name} #{last_name}, #{location}]"
    end
  end
end

# To Compile : c "person.exs", "." it creates a Elixir.Person.beam file that elixir understands in machine level language

# Summary : Functions not only differ by name, but also by the number of arguments that they take, as well as the pattern of those arguments.

# Structs are actually Maps with one extra key '__struct__', hence can be passed to Map functions

# Struct and Protocols: ~D[1996-03-28] this is also a struct that Elixir shows like this for better Readability

# In a mix project, you can compile code by running iex -S mix to run your project with mix

# Now whenever we wanna use person module, we will use People.person to access it. Here's how Alias comes into action as it helps us define a alias for People.Person

# izzy |> People.Person.toggle_location - Correct Results

# But what if I use : izzy |> Person.toggle_location  -- This will generate an Error.

# Once i define an alias like : alias People.Person, then I can use : izzy |> Person.toggle_location -- it will work fine now.
