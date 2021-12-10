lines = File.read('6.txt')

fish = lines.split(',').each_with_object(Hash.new(0)) do |f, obj|
  obj[f.to_i] += 1
end

1.upto(256) do
  fish.transform_keys! { |k| k - 1}
  fish[6] += fish[8] = fish.delete(-1) || 0
end

puts fish.sum { |a| a[1] }
