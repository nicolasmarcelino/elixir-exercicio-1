defmodule MeuEnum
do
  defp filtrar([], _filtro, acc)
  do
    inverter(acc, [])
  end

  defp filtrar([h | t], filtro, acc)
  do
    if filtro.(h)
    do
      filtrar(t, filtro, [h | acc])
    else
      filtrar(t, filtro, acc)
    end
  end

  def filtrar(lista, filtro)
  do
    filtrar(lista, filtro, [])
  end

  defp inverter([], acc)
  do
    acc
  end

  defp inverter([h | t], acc)
  do
    inverter(t, [h | acc])
  end

end

# IO.inspect(MeuEnum.filtrar([1, 2, 3, 4, 5, 6], fn x -> rem(x, 2) == 0 end))
# IO.inspect(MeuEnum.filtrar(["gato", "elefante", "cão"], &(String.length(&1) > 3)))