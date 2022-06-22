#Practice of Functions and Capture Operators in Elixix


#Function Definations
f_to_c = fn(f)-> IO.puts((f - 32)/1.8) end

seconds = fn(day)-> IO.puts(day*24*60*60) end


#Function Calls
seconds.(4)
f_to_c.(103)

#A new function that takes 2 argument maps and returns average age using Capture Operator
cal_avg = &(IO.puts((&1.age + &2.age)/2))

cal_avg.(%{age: 20},%{age: 30})
