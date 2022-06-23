#In this section we will read and write files

#READ method of File
File.read("file1.txt")

# -Pattern Matching to Confirm the File was loaded
{:ok, contents} = File.read("file1.txt")

#Code to Reverse the Text using Pipe Operator
contents |> String.split("\n") |> Enum.map(&String.reverse/1) |> Enum.join("\n")

#File reading line by line with File.Stream

stream = File.stream!("haiku.txt")

fixed_contents = stream |> Enum.map(&String.trim/1) |> Enum.map(&String.reverse/1) |> Enum.join("\n")

#Writing the Contents in File

#First Read it and Fix it
fixed_contents = "file1.txt" |> File.stream! |> Enum.map(&String.trim/1) |> Enum.map(&String.reverse/1) |> Enum.join("\n")

#than put it in a new file
File.write("fixed-file1.txt", fixed_contents)


#Renaming a File
File.rename("file1.txt", "reversed-file1.txt")

#Deleting a File, first create a file to delete

File.write("delete-me.txt", "delete me")

#Than Delete it
File.rm("delete-me.txt")


#Exercise Question
# Can you make Elixir write a program for itself? Put this code into a file called script.ex with File.write/2: IO.puts "This file was generated from Elixir" and then make it run by running elixir that-file.ex.

#Solution in Script.exs

# Figure out what happens if you try to delete a file that doesn't exist with File.rm/1. Is this what you expected to happen?

#Answer: It returns an error tuple {:error, :enoent} if the file doesn't exist
