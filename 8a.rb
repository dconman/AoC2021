lines = File.readlines('8.txt')

lengths = {
  1 => 2,
  4 => 4,
  7 => 3,
  8 => 7
}

sum = lines.sum do |line|
  line.split(' | ')[1].split(' ').count do |s|
    lengths.values.include? s.length
  end
end

puts sum
