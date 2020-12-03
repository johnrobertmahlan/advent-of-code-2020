valids = 0
invalids = 0

File.open("input.txt", "r") do |file|
    file.each_line do |line|
        range, letter, pw = line.split(" ")
        match = range.match(/(?<low>\d+)-(?<high>\d+)/)
        letter = letter.gsub(":", "")
        if letter == pw[match[:low].to_i - 1] && letter == pw[match[:high].to_i - 1]
            invalids += 1
        elsif letter == pw[match[:low].to_i - 1] && letter != pw[match[:high].to_i - 1]
            valids += 1
        elsif letter != pw[match[:low].to_i - 1] && letter == pw[match[:high].to_i - 1]
            valids += 1
        else
            invalids += 1
        end
        valids
        invalids
    end
end

p valids
p invalids