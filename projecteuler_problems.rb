
def three_and_five(range)
  @total = 0
  range.each do |number|
    if (number % 3 == 0 && number % 5 == 0)
      @total += number
    end
  end
  return @total
end

def fibonacci_sum(max)
  @total = 0
  @first = 0
  @second = 1
  while @second < max
    @next = @first + @second
    @first = @second
    @second = @next
    @total += @next
  end
  return @total
end

def largest_prime(number)
  @largest = number
  (2...@largest).each do |i|
    is_divisible = ((@largest % i) == 0)
    if is_divisible
      # divisor found; stop and return new range!
      return @largest = largest_prime(@largest / i)
    end
    i += 1
  end
  # no divisors found
  return @largest
end

def largest_palindrome(number_of_digits,symetrical=true)
  @largest_number = "9"
  @smallest_number = "1"
  if symetrical
    (number_of_digits-1).times do
      @largest_number += "9"
      @smallest_number += "0"
    end
  end
  @smallest_number = @smallest_number.to_i
  @largest_number = @largest_number.to_i
  @largest_number.downto(@smallest_number){|number|
    number.downto(@smallest_number){|multiple|
      product = number * multiple
      if product.to_s == product.to_s.reverse
        return product
      end
    }
  }
end

puts three_and_five(1..1000)
puts fibonacci_sum(4000000)
puts largest_prime(600851475143)
puts largest_palindrome(3)