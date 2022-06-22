#IO Bound Operations by User

name = IO.gets "What is your name? "
age = IO.gets "And what is your age? "
IO.puts "Hello, #{String.trim(name)}! You're #{String.trim(age)}? That's so old!"

#String Module
# info = "Hi, let's work on this string and do something!"
# IO.puts(String.upcase(info))

# IO.puts(String.downcase(info))

# IO.puts(String.replace(info,"'",":"))

# IO.puts(String.split(info," "))

# IO.puts(String.reverse(info))

#Exercise Chapter 8
# Make a program that generates a very short story. Get it to take some input of a person, a place and an object -- using IO.gets/1 and combine all three into a little sentence, output with IO.puts/1.
# Ponder on what happens when you remove the IO.puts from the beginning of Line 3 in greet.exs and then run the program with elixir greet.exs. Think about how this would be different if you put that code into an iex prompt.


#Making a program using Functions and IO Bounds on String // 1
_act = fn() -> name = IO.gets("Name?")
  object = IO.gets("Object?")
  place = IO.gets("Place?")
  IO.puts "Hi, #{String.trim(name)} is eating #{String.trim(object)} at the #{String.trim(place)} Street!"
end

# act.()
