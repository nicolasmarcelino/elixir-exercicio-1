defmodule Geometria do

  def area(%{tipo: :quadrado, lado: l}) when not is_number(l) or l <= 0 do
    {:error, :dimensoes_invalidas}
  end

  def area(%{tipo: :quadrado, lado: l}) do
    {:ok, l * l}
  end

  def area(%{tipo: :retangulo, largura: l, altura: a}) when not is_number(l) or l <= 0 do
    {:error, :dimensoes_invalidas}
  end

  def area(%{tipo: :retangulo, largura: l, altura: a}) when not is_number(a) or a <= 0 do
    {:error, :dimensoes_invalidas}
  end

  def area(%{tipo: :retangulo, largura: l, altura: a}) do
    {:ok, l * a}
  end

  def area(%{tipo: :circulo, raio: r}) when not is_number(r) or r <= 0 do
    {:error, :dimensoes_invalidas}
  end

  def area(%{tipo: :circulo, raio: r}) do
    {:ok, :math.pi() * (r * r)}
  end

  def area(%{tipo: _})
  do
    {:error, :forma_desconhecida}
  end
end
