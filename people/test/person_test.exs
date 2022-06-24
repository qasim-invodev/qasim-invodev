#ExUnit Testing and Documentation testing

defmodule People.PersonTest do
  use ExUnit.Case
  alias People.Person
  doctest People.Person

  test "full_name/1 with mononyms" do
    teller = %Person{
      first_name: "Teller"
    }

    assert teller |> Person.full_name() === "Teller"

    madonna = %Person{
      first_name: "Madonna"
    }

    assert madonna |> Person.full_name() === "Madonna"
  end

  test "age/1" do
    qasim = %Person{
      birthday: ~D[1996-03-28]
    }

    assert qasim |> Person.age() === 26.239561943874058
  end
end
