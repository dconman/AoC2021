lines = File.readlines('5.txt')

map = []

lines.each do |line|
  x1, y1, x2, y2 = line.scan(/\d+/).map(&:to_i)
  next unless x1 == x2 || y1 == y2
  xs = Range.new(*[x1,x2].sort!)
  ys = Range.new(*[y1,y2].sort!)
  xs.each do |x|
    map[x] ||= []
    ys.each do |y|
      map[x][y] = (map[x][y] || 0) + 1
    end
  end
end

puts map.flatten.compact.count { |x| x > 1 }
