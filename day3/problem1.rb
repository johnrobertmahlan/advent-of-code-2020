idx = 0
key = 1
length = 0
trees = 0
spaces = 0
count = 0
grid = Hash.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
      grid[count] = line.gsub("\n", "")
      count += 1
      length = line.length
  end
end

grid.each do |key, value|
    if idx < length
      new_position = value[idx]
      new_position == '.' ? spaces += 1 : trees += 1
    else
      idx = idx - length
      new_position = value[idx]
      new_position == '.' ? spaces += 1 : trees += 1
    end
    idx += 3
    key += 1
    trees
    spaces
end
  
p trees