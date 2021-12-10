lines = File.read('6.txt')

fish = lines.split(',').map(&:to_i)

1.upto(80) do
  new_fish = 0
  fish.each_index do |i|
    fish[i] -= 1 and next unless fish[i].zero?
    new_fish +=1 
    fish[i] = 6
  end
  fish += Array.new(new_fish, 8)
end

puts fish.count
