defmodule E04 do
  def largest_palindrome_product(digits) do
    digit_range(digits)
      |> Enum.to_list
      |> list_products
      |> Enum.filter(fn(i) -> is_pal?(i) end)
      |> Enum.max
  end

  defp digit_range(digits) do
    # Accurate for digits < 16
    round(:math.pow(10, (digits-1)))..round(:math.pow(10, digits)-1)
  end

  defp list_products([h|t]) do
    Enum.map(t, fn(n) -> h*n end) ++ list_products(t)
  end

  defp list_products([]) do
    []
  end

  defp is_pal?(int) do
    to_string(int) == String.reverse(to_string(int))
  end
end

IO.puts E04.largest_palindrome_product(3)
