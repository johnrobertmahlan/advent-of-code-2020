arr = []
# Elements of arr are given by the website

newarr = Array.new

find_two_sums = lambda do |arr|
  arr.each do |num|
    arr.any? {|x| x + num == 2020} ? newarr.push(num) : next
  end
  return newarr.reduce(:*)
end

puts find_two_sums.(arr)

newerarr = Array.new
reallynewarr = Array.new

find_three_sums = lambda do |arr|
  arr.map {|num| 
    newnum = 2020 - num
    newerarr.push(newnum)
  }
  arr.each do |num|
    newerarr.each do |num2|
      if arr.any? {|x| x + num == num2}
        reallynewarr.push(num) 
      end
    end
  end
  return reallynewarr.uniq.reduce(:*)
end

puts find_three_sums.(arr)