lines = File.readlines('5.txt')

map = []

def range(a,b)
  a > b ? a.downto(b) : a.upto(b)
end

lines.each do |line|
  x1, y1, x2, y2 = line.scan(/\d+/).map(&:to_i)
  
  if x1 == x2
    Range.new(*[y1,y2].sort!).map { |y| [x1, y] }
  elsif y1 == y2
    Range.new(*[x1,x2].sort!).map { |x| [x, y1]}
  else
    range(x1,x2).zip(range(y1,y2))
  end.each do |x, y|
    map[x] ||= []
    map[x][y] = (map[x][y] || 0) + 1
  end
end

puts map.flatten.compact.count { |x| x > 1 }
