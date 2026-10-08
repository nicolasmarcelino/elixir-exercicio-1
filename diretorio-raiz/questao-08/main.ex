defmodule Logistica do
  def calcular_frete(peso, _) when not is_number(peso) or peso <= 0 do
    {:error, "Peso deve ser maior que zero"}
  end

  def calcular_frete(peso, {:nordeste, :padrao}) do
    {:ok, 15.00 + peso * 2.50}
  end

  def calcular_frete(peso, {:nordeste, :expresso}) do
    {:ok, 30.00 + peso * 4.00}
  end

  def calcular_frete(peso, {:sul, :padrao}) do
    {:ok, 20.00 + peso * 3.00}
  end

  def calcular_frete(peso, {:sul, :expresso}) do
    {:ok, 38.00 + peso * 5.00}
  end

  def calcular_frete(_, _) do
    {:error, :rota_indisponivel}
  end
end
