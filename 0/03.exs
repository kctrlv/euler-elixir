defmodule E03 do
  def largest_prime_factor(x) do
    prime_factors(x)
      |> List.last
  end

  defp prime_factors(x) do
    factors(x)
      |> Enum.filter(fn(i) -> is_prime(i) end)
  end

  defp is_prime(x) do
    factors(x)
      |> length() == 0
  end

  defp factors(x) do
    2..round(:math.sqrt(x))
      |> Enum.filter(fn(i) -> rem(x, i) == 0 end)
  end
end

IO.puts E03.largest_prime_factor(600_851_475_143)
