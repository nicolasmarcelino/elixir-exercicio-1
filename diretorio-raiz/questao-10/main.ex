defmodule Autenticador do
  defp validar_payload(payload) when is_nil(payload) or payload == %{} do
    {:error, :payload_vazio}
  end

  defp validar_payload(payload) do
    {:ok, payload}
  end

  defp validar_role("admin") do
    {:ok}
  end

  defp validar_role(_) do
    {:error, :acesso_negado}
  end

  defp validar_headers(%{"authorization" => "Bearer " <> token}) do
    if String.trim(token) != "" do
      {:ok, token}
    else
      {:error, :token_invalido}
    end
  end

  defp validar_headers(_), do: {:error, :token_invalido}

  def validar_requisicao(req) do
    with {:ok, token} <- validar_headers(req.headers),
         {:ok} <- validar_role(Map.get(req.body, "role")),
         {:ok, payload} <- validar_payload(Map.get(req.body, "payload")) do
      {:ok, %{token: token, payload: payload}}
    end
  end
end
