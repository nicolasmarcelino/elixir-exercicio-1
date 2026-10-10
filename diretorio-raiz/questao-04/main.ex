defmodule Contador
do
  defp frequencia([], mapa) do
    mapa
  end

  defp frequencia([h | t], mapa) do
    frequencia(t, Map.update(mapa, h, 1, fn contagem -> contagem + 1 end))
  end


  def frequencia(lista) do
    frequencia(lista, %{})
  end
end
