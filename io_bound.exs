#IO Bound Operations by User

name = IO.gets "What is your name? "
age = IO.gets "And what is your age? "
IO.puts "Hello, #{String.trim(name)}! You're #{String.trim(age)}? That's so old!"

#String Module
info = "Hi, let's work on this string and do something!"
IO.puts(String.upcase(info))

IO.puts(String.downcase(info))

IO.puts(String.replace(info,"'",":"))

IO.puts(String.split(info," "))

IO.puts(String.reverse(info))
