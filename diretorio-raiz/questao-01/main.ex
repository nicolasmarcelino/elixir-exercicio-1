defmodule Conversor do
  def converter(valor, _) when valor < 0 or not is_number(valor) do
    {:error, "Valor deve ser positivo"}
  end

  def converter(valor, {:usd, :brl}) do
    {:ok, valor * 5.5}
  end

  def converter(valor, {:eur, :brl}) do
    {:ok, valor * 6}
  end

  def converter(valor, {:brl, :usd}) do
    {:ok, valor / 5.5}
  end

  def converter(_, _) do
    {:error, :conversao_nao_suportada}
  end
end
