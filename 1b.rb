lines = File.readlines('1.txt').map(&:to_i)

answer = lines.zip(lines.drop(3)).reduce(0) do |acc, (a,b)|
  if a && b && b > a
    acc + 1
  else
    acc
  end
end

puts answer