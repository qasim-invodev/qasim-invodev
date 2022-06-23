#We will be learning about modules and struct in this Chapter

#Modules are a way to keep your functions seperated based on the Data they will be working on.

#Structs are a special kind of Map

#For now, let's have a look at Sigils

person = %{
  first_name: "Izzy",
  last_name: "Bell",
  birthday: ~D[1987-12-04],
}

# ~D in this person represents a Sigil. Any Alphabet literal followed by a '~' symbol is called a Sigil.

#In this example, it represent a data that is turned into a Date Format.

#Let's do some operations

#represent full name of the person
full_name = fn (person) -> "#{person.first_name} #{person.last_name}" end

full_name.(person)

#Find age of a person
age = fn (person) ->
  days =  Date.diff(Date.utc_today, person.birthday)
  days / 365.25
end

age.(person)

# Now let's create our own Module named Person and store this module in person.exs file

#To compile Code, we just use : c "person.exs", "."
