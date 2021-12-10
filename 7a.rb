lines = File.read('7.txt')

crabs = lines.split(',').map(&:to_i)

puts (crabs.min..crabs.max).map{ |k| crabs.sum { |c| (c-k).abs } }.min