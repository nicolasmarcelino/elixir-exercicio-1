defmodule RelatorioVendas do

  defp calcular([]) do
    {:ok, 0, 0.0}
  end

  defp calcular(pedidos) do
    media = Enum.reduce(pedidos, 0, fn pedido, acc -> pedido.valor + acc end) / Enum.count(pedidos)

    {
      :ok,
      Enum.count(pedidos),
      media
    }
  end

  def gerar([]) do
    {:ok, 0, 0.0}
  end

  def gerar(pedidos) do
    pedidos |> Enum.filter(fn pedido -> pedido.status == :pago end) |> calcular()
  end
end
