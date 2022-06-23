#Working with Lists and Enums

#Iterating a List
_cities = ["vienna", "melbourne", "osaka", "calgary", "sydney"]
# Enum.each(cities, &IO.puts/1)


#Other Functionality with Iterables

# Enum.each(cities, &String.capitalize/1)

#Exercise Questions Chapter 9

#Question 1:
# Use a combination of Enum.map/2 and String.replace/3 to replace all the e's in these words with another letter of your choosing: ["a", "very", "fine", "collection", "of", "words", "enunciated"]
q1 = ["a", "very", "fine", "collection", "of", "words", "enunciated"]
# Enum.map(q1, fn(q) ->  IO.puts(String.replace(q,"e","O")) end)

#Also can be written as:
Enum.map(q1, &String.replace(&1,"e","O"))



#Question 2:
# Use Enum.reduce/2 to multiply these numbers together: [5, 12, 9, 24, 9, 18]
prod = [5, 12, 9, 24, 9, 18]
Enum.reduce(prod, fn (pro,mul) -> mul * pro end)
