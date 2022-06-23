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
