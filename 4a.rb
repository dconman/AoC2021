lines = File.readlines('4.txt')

draws = lines.first.split(',')

board_no = 0
boards = lines.drop(2).each_with_object([]) do |line, obj|
  next board_no += 1 if line.rstrip.empty?
  obj[board_no] ||= []
  obj[board_no] << line.split(' ')
end

draws.each do |draw|
  boards.each_index do |bn|
    boards[bn].each_index do |rn|
      boards[bn][rn].each_with_index do |e, cn|
        boards[bn][rn][cn] = nil if e == draw
      end
    end
    next unless boards[bn].map(&:compact).any?(&:empty?) || boards[bn].transpose.map(&:compact).any?(&:empty?)
    puts boards[bn].flatten.sum(&:to_i) * draw.to_i
    exit
  end
end
