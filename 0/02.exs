defmodule Euler02 do
  def sum_even_fibs_under(x) do
    even_fibs_under(x)
      |> sum_list()
  end

  defp even_fibs_under(x) do
    fibs_under(x)
      |> Enum.filter(fn(n) -> (rem n, 2) == 0 end)
  end

  defp fibs_under(x, fibs \\ [1,2]) do
    if List.last(fibs) >= x do
      fibs -- Enum.take(fibs, -1)
    else
      fibs = fibs ++ [sum_list(Enum.take(fibs, -2))]
      fibs_under(x, fibs)
    end
  end

  defp sum_list([]) do
    0
  end

  defp sum_list([h|t]) do
    h + sum_list(t)
  end
end

IO.puts Euler02.sum_even_fibs_under(4_000_000)
