guess = nil
secret = Random.new().rand(1..10)

until guess == secret
  direction = guess && guess > secret ? 'high' : 'low'
  puts "Too %{direction}!" % {:direction => direction} unless guess == nil
  puts "Guess a number!"
  guess = (gets).to_i
end

puts "Correct! Well done!"
