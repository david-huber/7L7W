guess = nil
secret = Random.new().rand(1..10)

until guess == secret
  puts "Too #{guess > secret ? 'high' : 'low'}!" unless guess == nil
  puts "Guess a number between 1 and 10!"
  guess = (gets).to_i
end

puts "Correct! Well done!"
