#Pattern Matching

#Lists
those_who_are_assembled = [
  %{age: "30ish", gender: "Female", name: "Izzy"},
  %{age: "30ish", gender: "Male", name: "The Author"},
  %{age: "56", gender: "Male", name: "Roberto"},
  %{age: "38", gender: "Female", name: "Juliet"},
  %{age: "21", gender: "Female", name: "Mary"},
  %{age: "67", gender: "Female", name: "Bobalina"},
  %{age: "54", gender: "Male", name: "Charlie"},
  %{age: "10", gender: "Male", name: "Charlie (no relation)"}
  ]

#[first | others] = those_who_are_assembled

#Maps

person = %{name: "Izzy", age: "30ish"}
#explicit assigning on name and age
#%{name: name, age: age} = person

#[first_person = %{name: first_name} | others] = those_who_are_assembled

#Pattern Matching in Functions using Strings

road = fn
  "high" -> IO.puts("You take the high road!")
  "low" -> IO.puts("I'll take the low road! (and I'll get there before you)")
  _ -> IO.puts("Take the 'high' road or the 'low' road, thanks!")
end

#road.("middle")


#Maps and Functions

greeting = fn
  %{name: name} -> "Hello, #{name}!"
  %{} -> "Hello, Anonymous Stranger!"
end

#greeting.(%{})

#Exercise Question

#Make a function that takes either a map containing a "name" and "age", or just a map containing "name".
#Change the output depending on if "age" is present. What happens if you switch the order of the function clauses? What can you learn from this?

practice = fn
  %{age: age,name: name} -> IO.puts("Hello, #{name} and aged #{age}")
  %{name: name} -> IO.puts("Hello, #{name}!")
end

practice.(%{name: "Qasim"})

#A good rule to follow is that your clauses should be ordered from most-specific to least-specific. If you do not order your clauses like this, then you may have a clause matching before others unexpectedly.
