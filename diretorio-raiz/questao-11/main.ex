defmodule Classificador do
  defp classificar(pontuacao) do
    cond do
      pontuacao in 0..499 -> {:ok, :ouro}
      pontuacao in 500..999 -> {:ok, :diamante}
      true -> {:ok, :mestre}
    end
  end

  defp validar_modo(modo_de_jogo, pontuacao) do
    case modo_de_jogo do
      :ranqueada ->
        classificar(pontuacao)

      :casual ->
         {:ok, :sem_ranque}

      _ ->
        {:error, :modo_desconhecido}
    end
  end

  defp validar_pontuacao(pontuacao) when pontuacao < 0 or not is_number(pontuacao) do
    {:error, :pontuacao_invalida}
  end

  defp validar_pontuacao(_) do
    {:ok}
  end

  def avaliar_desempenho({modo_de_jogo, pontuacao}) do
    with {:ok} <- validar_pontuacao(pontuacao),
         {:ok, ranque} <- validar_modo(modo_de_jogo, pontuacao) do
      {:ok, ranque}
    end
  end
end
