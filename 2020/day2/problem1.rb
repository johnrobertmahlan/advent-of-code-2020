valids = 0

File.open("input.txt", "r") do |file|
    file.each_line do |line|
        range, letter, pw = line.split(" ")
        match = range.match(/(?<low>\d+)-(?<high>\d+)/)
        count = pw.count "#{letter}"
        if count>= match[:low].to_i && count <= match[:high].to_i
            valids += 1
        end
        valids
    end
end

p valids