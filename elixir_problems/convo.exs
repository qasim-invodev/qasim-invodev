# Bob is a lackadaisical teenager. In conversation, his responses are very limited.
# Bob answers 'Sure.' if you ask him a question.
# He answers 'Whoa, chill out!' if you yell at him.
# He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
# He says 'Fine. Be that way!' if you address him without actually saying anything.
# He answers 'Whatever.' to anything else.
# Bob's conversational partner is a purist when it comes to written communication and always follows normal rules regarding sentence punctuation in English.

defmodule Conversation do
  @doc """
  Reply to the String with Conditional Conversation

  """
  @spec reply(String.t) :: String.t()
  def reply(sentence) do
    cond do
      String.last(sentence) == "?" and String.upcase(sentence) == sentence -> "Calm down, I know what I'm doing!"
      String.last(sentence) == "!" -> "Whoa, chill out!"
      String.last(sentence) == "?" -> "Sure."
      String.length(sentence) == 0 -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end

reply = Conversation.reply("blah blahj")
IO.puts reply
