length = 0
spaces = 0
trees = 0
grid = Array.new
tree_count = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
      grid << line.gsub("\n", "")
      length = line.length
  end
end

slopes = {
  1 => "1,1",
  2 => "3,1",
  3 => "5,1",
  4 => "7,1",
  5 => "1,2"
}



slopes.each do |slope, change|
  line_idx = 0
  string_idx = 0
  char = grid[line_idx][string_idx]
  line_idx += change.split(",")[1].to_i
  string_idx = change.split(",")[0].to_i
  while line_idx.to_i < grid.length
    if string_idx < grid[line_idx].length
      new_char = grid[line_idx][string_idx]
      new_char == '.' ? spaces += 1 : trees += 1
    else
      string_idx = string_idx - grid[line_idx].length
      new_char = grid[line_idx][string_idx]
      new_char == '.' ? spaces += 1 : trees += 1
    end
    line_idx += change.split(",")[1].to_i 
    string_idx += change.split(",")[0].to_i
  end
  trees
  tree_count.push(trees)
  trees = 0
end

p tree_count.reduce(:*)