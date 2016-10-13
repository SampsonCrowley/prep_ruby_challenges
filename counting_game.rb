
def counting_game (players,max)
  player = 0
  direction = 1
  (1..max).each{|count|
    if !(count == 1)
      if ((count-1).abs % 7 == 0)
        direction *= -1
      end
      if (0 == (count-1) % 11 )
        change = 2
      else
        change = 1
      end
    else
        direction = 1
        change = 1
    end
    player = player + (change * direction)
    if !player.between?(1,players)
      player = (player.abs - players).abs
    end
    #puts "player: #{player}, count: #{count}, direction: #{direction}, divisible by 7  #{(count-1) % 7 == 0}, change: #{change}, divisible by 11: #{(count-1) % 11 == 0}"
  }
  return player
end

puts counting_game(10,100)
puts counting_game(60,100)
