lines = File.readlines('8.txt')

LENGTHS = {
# 0 => 6,
  1 => 2,
# 2 => 5,
# 3 => 5,
  4 => 4,
# 5 => 5,
# 6 => 6,
  7 => 3,
  8 => 7,
# 9 => 6
}

def delete(arr, &block)
  i = arr.index(&block)
  arr.delete_at(i)
end

def deduce(digits)
  numbers = []
  LENGTHS.each do |k,v|
    numbers[k] = delete(digits) { |d| d.length == v }
  end
  numbers[9] = delete(digits) { |d| d.length == 6 && (numbers[4] - d).empty?}
  numbers[6] = delete(digits) { |d| d.length == 6 && (d - numbers[1]).length == 5}
  numbers[0] = delete(digits) { |d| d.length == 6}
  numbers[3] = delete(digits) { |d| d.length == 5 && (d - numbers[1]).length == 3}
  numbers[5] = delete(digits) { |d| d.length == 5 && (d - numbers[6]).empty?}
  numbers[2] = digits[0]
  numbers
end

sum = lines.sum do |line|
  digits = line.split.map(&:chars).map(&:sort)
  key = deduce(digits[0,10])
  num = ''
  digits[11,4].each_with_index.sum do |d,i|
    n = key.index(d)
    n * (10 ** (3-i))
  end
end

puts sum
