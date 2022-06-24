#Route for Age
#It calculates the age by getting it from Person and apply Person.age function on it

#Tip: Date.from_iso8601! this function converts string into date format before Date.diff can calculate the difference

defmodule People.Age do
  import Plug.Conn
  alias People.Person

  def init(options), do: options

  def call(%Plug.Conn{params: %{"birthday" => birthday}} = conn, _opts) do
    age = %Person{birthday: Date.from_iso8601!(birthday)} |> Person.age

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "You are #{age} years old!")
  end
end
