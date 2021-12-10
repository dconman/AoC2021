lines = File.readlines('4.txt')

draws = lines.first.split(',')

board_no = 0
boards = lines.drop(2).each_with_object([]) do |line, obj|
  next board_no += 1 if line.rstrip.empty?
  obj[board_no] ||= []
  obj[board_no] << line.split(' ')
end

finished_boards = {}

draws.each do |draw|
  boards.each_index do |bn|
    next if finished_boards.keys.include?(bn)
    boards[bn].each_index do |rn|
      boards[bn][rn].each_with_index do |e, cn|
        boards[bn][rn][cn] = nil if e == draw
      end
    end
    finished_boards[bn] = draw if boards[bn].map(&:compact).any?(&:empty?) || boards[bn].transpose.map(&:compact).any?(&:empty?)
  end
end
bn, draw = finished_boards.to_a.last
puts boards[bn].flatten.sum(&:to_i) * draw.to_i
