depth = 0
distance = 0
aim = 0

File.readlines('2.txt').each do |line|
  direction, amount = line.split(" ")
  amount = amount.to_i
  case direction
    when 'forward'
      distance += amount
      depth += amount * aim
    when 'up'
      aim -= amount
    when 'down'
      aim += amount
  end
end
puts depth * distance
