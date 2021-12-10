lines = File.read('7.txt')

crabs = lines.split(',').map(&:to_i)

def fuel_usage(steps)
  steps * (2 + (steps - 1)) / 2
end

puts (crabs.min..crabs.max).map { |k| crabs.sum { |c| fuel_usage((c-k).abs) } }.min