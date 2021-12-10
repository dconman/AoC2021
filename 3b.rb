lines = File.readlines('3.txt')

def func(arr, idx, op)
  return arr.first unless arr.length > 1
  return if idx >= arr.first.length
  cutoff = (arr.length / 2.0).ceil
  one_count = 
    arr.reduce(0) do |acc, e|
      if e[idx] == '1'
        acc + 1
      else
        acc
      end
    end
  
  most_common = one_count >= cutoff ? '1' : '0'
  
  new_arr = arr.send(op) do |e|
    e[idx] == most_common
  end

  func(new_arr, idx + 1, op)
end

oxy = func(lines, 0, :select)
co2 = func(lines, 0, :reject)

puts oxy.to_i(2) * co2.to_i(2)
