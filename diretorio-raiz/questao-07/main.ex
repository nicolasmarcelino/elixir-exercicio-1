defmodule Cadastro do
  defp validar_idade(idade) do
    if is_integer(idade) do
      if idade >= 18 do
        {:ok, idade}
      else
        {:error, :menor_de_idade}
      end
    else
      {:error, :idade_invalida}
    end
  end

  defp validar_email(email) do
    if String.contains?(email, "@") and String.contains?(email, ".") do
      {:ok, email}
    else
      {:error, :email_invalido}
    end
  end

  defp validar_nome(nome) do
    if nome |> String.trim() == "" do
      {:error, :nome_invalido}
    else
      {:ok, nome}
    end
  end

  def processar_usuario(mapa) do
    with {:ok, nome} <- validar_nome(Map.get(mapa, :nome)),
         {:ok, email} <- validar_email(Map.get(mapa, :email)),
         {:ok, idade} <- validar_idade(Map.get(mapa, :idade)) do
      {:ok, %{nome: nome, email: email, idade: idade, status: :ativo}}
    end
  end
end

IO.inspect(
  Cadastro.processar_usuario(%{
    nome: "Lucas",
    email: "lucas@test.com",
    idade: 19
  })
)
