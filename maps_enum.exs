#In this Chapter we will cover Maps and how to Enumerate them

#Enum.each on Maps

person = %{name: "Izzy", age: "30ish", gender: "Female"}
Enum.each(person, fn ({key, value}) -> IO.puts value end)

#Enum.map() on Maps
forecast = %{
  "Monday" => 28,
  "Tuesday" => 29,
  "Wednesday" => 29,
  "Thursday" => 24,
  "Friday" => 16,
  "Saturday" => 16,
  "Sunday" => 20
}

new_forecast = Enum.map(forecast, fn ({day, temp}) -> {day, temp * 1.8 + 32} end)

#Here New_forecast is a list and not a map as a return type.
#To convert it back into the Map, we'll use Enum.into()

Enum.into(new_forecast, %{})

#Map Module

#Map Functions
# Map.get(), Map.put(), Map.merge(), Map.delete()

izzy = %{"name" => "Izzy", "age" => "30ish", "gender" => "Female"}

#Get

Map.get(izzy,"name")

#Put

izzy = Map.put(izzy, "age", "40ish")

#Merge

izzy = Map.merge(izzy, %{"age" => "40ish", "country" => "Australia"})

    #Pipe Merging

    %{izzy | "age" => "40ish", "name" => "Isadora"}

    # However it will not work if the Key doesn't exist in the Map

# delete

izzy = Map.delete(izzy, "country")
