defmodule Banco do
  defp verificar_saldo(saldo, valor) do
    if saldo >= valor + 2.0 do
      {:ok}
    else
      {:error, :saldo_insuficiente}
    end
  end

  defp verificar_contas(conta_origem, conta_destino) do
    if conta_origem.status == :ativa and conta_destino.status == :ativa do
      {:ok}
    else
      {:error, :conta_inativa}
    end
  end

  def validar_valor(valor) when is_number(valor) and valor > 0 do
    {:ok, valor}
  end

  def validar_valor(_) do
    {:error, :valor_invalido}
  end

  def autorizar_transferencia(conta_origem, conta_destino, valor) do
    with {:ok, valor} <- validar_valor(valor),
         {:ok} <- verificar_contas(conta_origem, conta_destino),
         {:ok} <- verificar_saldo(conta_origem.saldo, valor) do
      {:ok, %{valor: valor, taxa: 2.0, novo_saldo_origem: conta_origem.saldo - valor - 2.0}}
    end
  end
end
