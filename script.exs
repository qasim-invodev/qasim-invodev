File.write(
  "generated.exs",
  Macro.to_string(quote do: IO.puts "This file was generated from Elixir")
)
