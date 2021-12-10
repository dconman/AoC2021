depth = 0
distance = 0

File.readlines('2.txt').each do |line|
  direction, amount = line.split(" ")
  amount = amount.to_i
  case direction
    when 'forward'
      distance += amount
    when 'up'
      depth -= amount
    when 'down'
      depth += amount
  end
end
puts depth * distance
