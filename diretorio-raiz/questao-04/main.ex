defmodule Contador
do
  defp contar([], mapa) do
    mapa
  end

  defp contar([h | t], mapa) do
    contar(t, Map.update(mapa, h, 1, fn contagem -> contagem + 1 end))
  end


  def contar(lista) do
    contar(lista, %{})
  end
end

# IO.inspect(Contador.contar(["elixir", "go", "elixir"]))
