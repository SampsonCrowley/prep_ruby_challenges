
def counting_game (players,max)
  player = 1
  count = 0
  direction = 1
  (1..max).each{|count|
    if (count % 7 == 0)
      direction *= -1
    end
    if count % 11 == 0
      change = 2
    else
      change = 1
    end
    player = player + (change * direction)
    if !player.between?(1,players)
      player = (player.abs - players).abs
    end
    #puts "#{player} player, #{count} count, #{direction} direction, #{count % 7 == 0} 7, #{change} change, #{count % 11 == 0} 11"
  }
  return player
end

puts counting_game(3,100)
puts counting_game(60,100)
