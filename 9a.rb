lines = File.readlines('9.txt', chomp: true)


map = lines.map { |line| line.chars.map(&:to_i) }

def local_min?(m,r,c)
  [
    m[r][c-1],
    m[r][c+1],
    m[r-1]&.fetch(c),
    m[r+1]&.fetch(c)
  ].compact.all? do |x|
    x >= m[r][c]
  end
end

danger = map.each_index.flat_map do |r|
  map[r].each_index.map do |c|
    next 0 unless local_min?(map,r,c)
    #puts [r,c,map[r][c]].inspect
    1 + map[r][c]
  end
end.sum

puts danger