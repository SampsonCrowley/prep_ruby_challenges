
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

def smallest_multiple(low,high)
  divisible = false
  number = low * high
  while !divisible
    divisible = true
    number = number + high
    (low..high).each{|i|
      if !(number % i == 0)
        divisible = false
        break
      end
    }
  end
  return number
end

def sum_square_difference(range)
  sum = 0
  square = 0
  (range).each{|number|
    sum += number
    square += number**2
  }
  difference = (sum**2 - square).abs
end


def nth_prime(target, n = false)
  if !n
    n = target**2
  end
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| nums[m] = nil}  if nums[i]
  end
  primes = nums.compact
  if primes.length < target
    return nth_prime(target, n**2)
  end
  return primes[target-1]
end

def largest_product_in_a_series(number_string,step)
  @record = 0
  @position = 0
  numbers = number_string.split("")
  num_list = []
  numbers.each{|number| num_list.push(number.to_i)}
  iterate = num_list.length-step
  iterate.times do |i|
    @sum = 1
    (i..i+step-1).step(1){|m| 
      @sum *= num_list[m]
    }
    if @sum > @record
      @position = i
      @record = @sum
    end
  end
  return "position: #{@position}, total: #{@record}"
end

def summation_of_primes(max)
  n = max
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| nums[m] = nil}  if nums[i]
  end
  primes = nums.compact
  return primes.inject(:+)
end

def reverse(input_array)
  while input_array.length != 0 
    second.push(input_array[-1])
    input_array.pop
  end
  return second
end

def light_switches
  @nums = []
  (1..100).each{
    @nums.push("off")
  }
  (1..100).each{|trip|
    (trip-1..99).step(trip){|m|
      if @nums[m] == "off"
        @nums[m] = "on"
      else
        @nums[m] = "off"
      end
    }
  }
  return @nums
end

def stock_picker(prices)
  @largest = 0
  @pair = [0,0]
  i=0
  while i < prices.length-1
    n = i+1
    while n < prices.length
      difference = prices[n] - prices[i]
      if difference > @largest
        @largest = difference
        @pair = [i,n]
      end
      n += 1
    end
    i += 1
  end
  return @pair
end



puts three_and_five(1..1000)
puts fibonacci_sum(4000000)
puts largest_prime(600851475143)
puts largest_palindrome(3)
puts smallest_multiple(1,10)
puts sum_square_difference(1..100)
puts nth_prime(6)
puts nth_prime(100)
puts largest_product_in_a_series("09458394323523452345234523452345234523452345234523459303948",13)
puts summation_of_primes(30)
p light_switches
p stock_picker([44,10,66,73,12,12,54,23,67,87,1,1000])