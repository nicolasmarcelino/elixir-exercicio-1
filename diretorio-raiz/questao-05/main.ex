defmodule Texto do
  def palavras_unicas(texto)
  do
    texto |> String.downcase()
    |> String.replace(",", "")
    |> String.replace(".", "")
    |> String.replace("!", "")
    |> String.replace("?", "")
    |> String.split(" ")
    |> Enum.filter(fn palavra -> String.length(palavra) > 3 end)
    |> Enum.uniq()
    |> Enum.sort()
  end
end

# IO.inspect(Texto.palavras_unicas("Elixir é incrível! Aprender Elixir torna a programação divertida."))
