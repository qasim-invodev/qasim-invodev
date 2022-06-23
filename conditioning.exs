#Conditional Coding in Elixir

# 4 main helpers in Conditional  Coding:
# case, cond, if, with


# Let's see "case" first
case File.read("reversed-file1.txt") do
  {:ok, contents} ->
    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.reverse/1)
    |> Enum.join("\n")
  {:error, :enoent} ->
    IO.puts "Could not find haiku.txt"
end

#here we don't use backslashes because Case sees until the end keyword and chain them together
#if we put \ in it than it runs it line by line

#Better Approach to handle unexpected Errors
case File.read("reversed-file1.txt") do
  {:ok, contents} ->
    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.reverse/1)
    |> Enum.join("\n")
  {:error, :enoent} ->
    IO.puts "Could not find haiku.txt"
  {:error, _} ->
    IO.puts "Something unexpected happened, please try again."
end


#Cond is the cousin of case :P
#let's see what it can do.
num = 26
cond do
  num < 50 -> IO.puts "Number is less than 50"
  num > 50 -> IO.puts "Number is greater than 50"
  num == 50 -> IO.puts "Number is exactly 50"
end


#Then comes if, unless & else. Let's see their superpowers

#if

if num == 50 do
  IO.puts "Number is exactly 50"
end

#If value is not equal to 50, it will give a None output which in elixir is represented by 'nil' keyword

#unless

unless num == 50 do
  IO.puts "Number is not 50"
end

#this says that "Unless the numer is equal to 50 do this. But if it is == 50 than it will return 'nil'

#else

#now that we've seen it, let's try a normal if, else.

if num == 50 do
  IO.puts "Number is 50"
else
  IO.puts "Number is not 50"
end

#A good approach

#With Statement:

#A way to chain statements together and make them operation

file_data = %{name: "haiku.txt"}

with {:ok, name} <- Map.fetch(file_data, :name),
     {:ok, contents} <- File.read(name) do
  contents
  |> String.split("\n", trim: true)
  |> Enum.map(&String.reverse/1)
  |> Enum.join("\n")
  |> IO.puts
else
  :error -> ":name key missing in file_data"
  {:error, :enoent} -> "Couldn't read file"
end
