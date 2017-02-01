defmodule E01 do
  def sum_mults_under(x) do
    mults_under(x)
      |> sum_list()
  end

  defp mults_under(x) do
    1..(x-1)
      |> Enum.filter(fn(i) -> divisible_3_and_5(i) end)
  end

  defp divisible_3_and_5(x) do
    (rem x, 5) == 0 || (rem x, 3) == 0
  end

  defp sum_list([]) do
    0
  end

  defp sum_list([h|t]) do
    h + sum_list(t)
  end
end

IO.puts E01.sum_mults_under(1000)
