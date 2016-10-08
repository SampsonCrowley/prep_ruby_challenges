=begin
PROGRAM CounterGame
  numfriends = 10
  player = 1
  count = 0
  direction = 1
  WHILE count < 100
    count = count + 1
    IF count % 7 = 0 THEN
      direction = -1 * direction
    END
    IF count % 11 = 0 THEN
      change = 2
    ELSE
      change = 1
    END
    player = player + change * direction
    IF player < 1 OR play > 10 THEN
      player =|(|player|- 10)|
    END
    IF count = 100 THEN
      winner = player
    END
  END
  return winner
END
=end
def counting_game (players,max)
  player = 1
  count = 0
  direction = 1
  (1..max).each{|count|
    if count % 7
      direction *= -1
    end
    if count % 11
      change = 2
    else
      change = 1
    end
    player = player + (change * direction)
    if !(1..10).includes? player
      player = (player.abs - 10).abs
    end
    if count == 100
      return player
    end
  }
end
puts counting_game(3,100)