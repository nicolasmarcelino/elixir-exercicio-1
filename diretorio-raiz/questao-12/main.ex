defmodule MeuEnum do
  defp inverter([], acc) do
    acc
  end

  defp inverter([h | t], acc) do
    inverter(t, [h | acc])
  end

  defp mapear([], _, acc) do
    inverter(acc, [])
  end

  defp mapear([h | t], fun, acc) do
    mapear(t, fun, [fun.(h) | acc])
  end

  def mapear(lista, fun) do
    mapear(lista, fun, [])
  end
end
