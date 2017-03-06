defmodule E43 do
  def sum_of_special_pandigitals do
    special_pandigitals()
    |> Enum.sum
  end

  def special_pandigitals do
    1..7
    |> Enum.reduce(pandigitals(), &filter_property(&2, &1)) #2 is acc, 1 is elem
    |> Enum.map(&Enum.join(&1) |> String.to_integer)
  end

  def filter_property(list, n) do
    Stream.filter(list, &has_special_property?(&1, n))
  end

  def pandigitals do
    permutations([1,2,3,4,5,6,7,8,9,0])
    |> Enum.reject(&List.first(&1) == 0)
  end

  def has_special_property?(list, n) when (n>0 and n<8) do #n from 1 to 7
    primes = [2,3,5,7,11,13,17]
    list
    |> Enum.slice(n,3)
    |> Enum.join
    |> String.to_integer
    |> rem(Enum.at(primes, n-1)) == 0
  end

  def permutations([]) do
    [[]]
  end

  def permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h|t]
  end
end

IO.puts E43.sum_of_special_pandigitals
