arr = []
#See input.txt for value

newarr = Array.new

find_two_sums = lambda do |arr|
  arr.each do |num|
    arr.any? {|x| x + num == 2020} ? newarr.push(num) : next
  end
  return newarr.reduce(:*)
end

puts find_two_sums.(arr)