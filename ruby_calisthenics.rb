def power(base,exponent)
  @total = 1
  (1..exponent).each{
    @total *= base
  }
  return @total
end

def factorial(number)
  @total = 1
  (1..number).each{|current_number|
    @total *= current_number
  }
  return @total
end

def uniques(input)
  unique_output = []
  input.each{|item|
    if !unique_output.include? item
      unique_output.push(item)
    end
  }
  return unique_output
end

def combinations(first,second)
  combination = []
  first.each{|item|
    second.each{|second_item|
      combination.push(item+second_item)
    }
  }
  return combination
end

def is_prime?(number)
  (2...number).each do |divisor|
    is_divisible = (number % divisor == 0)
    if is_divisible
      # divisor found
      return false
    end
    divisor += 1
  end
  # no divisors found
  return true
end

def overlap(rectangle_one, rectangle_two)
  #add additional section to array to easily compare top, right, bottom, left
  rectangle = [[[0,0],[0,0]],[[0,0],[0,0]]]
  box_limits = {
    'rectangle_one' => {
      top: rectangle_one[1][1], 
      right: rectangle_one[1][0], 
      bottom: rectangle_one[0][1], 
      left: rectangle_one[0][0]
    },
    'rectangle_two' => {
      top: rectangle_two[1][1], 
      right: rectangle_two[1][0], 
      bottom: rectangle_two[0][1], 
      left: rectangle_two[0][0]
    }
  }

  if rectangle_one[0][0] > rectangle_one[1][0]
    box_limits['rectangle_one'][:left] = rectangle_one[1][0]
    box_limits['rectangle_one'][:right] = rectangle_one[0][0]
  end
  if rectangle_one[0][1] > rectangle_one[1][1]
    box_limits['rectangle_one'][:bottom] = rectangle_one[1][1]
    box_limits['rectangle_one'][:top] = rectangle_one[0][1]
  end
  if rectangle_two[0][0] > rectangle_two[1][0]
    box_limits['rectangle_two'][:left] = rectangle_two[1][0]
    box_limits['rectangle_two'][:right] = rectangle_two[0][0]
  end
  if rectangle_two[0][1] > rectangle_two[1][1]
    box_limits['rectangle_two'][:bottom] = rectangle_two[1][1]
    box_limits['rectangle_two'][:top] = rectangle_two[0][1]
  end

  if (box_limits["rectangle_one"][:top] <= box_limits["rectangle_two"][:bottom] || 
    box_limits["rectangle_one"][:bottom] >= box_limits["rectangle_two"][:top] || 
    box_limits["rectangle_one"][:right] <= box_limits["rectangle_two"][:left] || 
    box_limits["rectangle_one"][:left] >= box_limits["rectangle_two"][:right])
    return false
  else
   return true
  end
end

p "power of (3,4) is #{power(3,4)}"
p "factorial of (1,5) is #{factorial(5)}"
p "uniques([1,5,\"frog\", 2,1,3,\"frog\"]): #{uniques([1,5,"frog", 2,1,3,"frog"])}"
p "combinations([\"to\"], [\"test\", \"it\"]): #{combinations(["to"], ["test", "it"])}"
p "17 is prime? #{is_prime?(17)}"
p "do these overlap:"
p "overlap([ [0,0],[3,3] ], [ [1,1],[4,5] ]): #{overlap([ [0,0],[3,3] ], [ [1,1],[4,5] ])}"
p "overlap([ [3,3],[0,0] ], [ [4,5],[1,1] ]): #{overlap([ [3,3],[0,0] ], [ [4,5],[1,1] ])}"
p "overlap([ [3,0],[0,3] ], [ [4,1],[1,5] ]): #{overlap([ [3,0],[0,3] ], [ [4,1],[1,5] ])}"
p "overlap([ [0,3],[3,0] ], [ [1,5],[4,1] ]): #{overlap([ [0,3],[3,0] ], [ [1,5],[4,1] ])}"
p "overlap( [ [0,0],[1,4] ], [ [1,1],[3,2] ] ): #{overlap( [ [0,0],[1,4] ], [ [1,1],[3,2] ] )}"
p "overlap( [ [1,4],[0,0] ], [ [3,2],[1,1] ] ): #{overlap( [ [1,4],[0,0] ], [ [3,2],[1,1] ] )}"
p "overlap([[0,4],[1,0]],[[3,1],[1,2]]): #{overlap([[0,4],[1,0]],[[3,1],[1,2]])}"
p "overlap([[1,0],[0,4]],[[1,2],[3,1]]): #{overlap([[1,0],[0,4]],[[1,2],[3,1]])}"