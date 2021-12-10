lines = File.readlines('3.txt')
ones_count = lines.each_with_object(Array.new(lines.first.length, 0)) do |line, tots|
  line.each_char.each_with_index do |char, idx|
    tots[idx] += 1 if char == '1'
  end
end

cutoff = lines.count / 2
gamma = ones_count.map { |c| c > cutoff ? '1' : '0' }.join
epsilon = gamma.each_char.map { |c| c == '1' ? '0' : '1'}.join
puts gamma.to_i(2) * epsilon.to_i(2)
