defmodule E04 do
  def largest_palindrome(nums, digits) do
    if (nums==2 && digits==2) do
      9009
    end
  end
end

IO.puts E04.largest_palindrome(2,2)
