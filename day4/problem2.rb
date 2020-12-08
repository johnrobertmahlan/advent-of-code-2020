contents = ''
valids = 0
invalids = 0
min_length = 7
opt_key = "cid"
h = Hash.new
hash_arr = Array.new
tests = Array.new

File.open("input.txt", "r") do |f|
    f.each_line do |line|
        contents << line 
    end
    arr = contents.split(/\n{2}/)
    arr.each do |str|
        newarr = str.split(/[\s\n]/)
        newarr.each do |str|
            split = str.split(":")
            h[split[0]] = split[1]
        end
        hash_arr.push(h)
        h = {}
    end
end

byr_valid = lambda do |hsh|
    match = hsh["byr"].match(/\d{4}/)
    if match
        if hsh["byr"].to_i >= 1920 && hsh["byr"].to_i <= 2002
            tests.push(1)
        else
            puts "Invalid"
        end
    else
        puts "Invalid"
    end
end

iyr_valid = lambda do |hsh|
    match = hsh["iyr"].match(/\d{4}/)
    if match
        if hsh["iyr"].to_i >= 2010 && hsh["iyr"].to_i <= 2020
            tests.push(1)
        else
            puts "Invalid"
        end
    else
        puts "Invalid"
    end
end

eyr_valid = lambda do |hsh|
    match = hsh["eyr"].match(/\d{4}/)
    if match
        if hsh["eyr"].to_i >= 2020 && hsh["eyr"].to_i <= 2030
            tests.push(1)
        else
            puts "Invalid"
        end
    else
        puts "Invalid"
    end
end

hgt_valid = lambda do |hsh|
    match = hsh["hgt"].match(/\d+(?<unit>cm|in)/)
    if match
        if match[:unit] == "cm"
            if hsh["hgt"].to_i >= 150 && hsh["hgt"].to_i <= 193
                tests.push(1)
            else
                puts "Invalid"
            end
        else
            if hsh["hgt"].to_i >= 59 && hsh["hgt"].to_i <= 76
                tests.push(1)
            else
                puts "Invalid"
            end
        end
    else
        puts "Invalid"
    end
end

hcl_valid = lambda do |hsh|
    match = hsh["hcl"].match(/#[0-9a-f]{6}/)
    if match
        tests.push(1)
    else
        puts "Invalid"
    end
end

ecl_valid = lambda do |hsh|
    match = hsh["ecl"].match(/amb|blu|brn|gry|grn|hzl|oth/)
    if match
        tests.push(1)
    else
        puts "Invalid"
    end
end

pid_valid = lambda do |hsh|
    match = hsh["pid"].match(/^\d{9}$/)
    if match
        tests.push(1)
    else
        puts "Invalid"
    end
end

run_tests = lambda do |arr|
    arr.each_with_index do |hsh, idx|
        if hsh.to_a.length < min_length
            puts "Invalid: #{idx} is too short"
        elsif hsh.to_a.length == min_length && hsh.has_key?(opt_key)
            puts "Invalid: #{idx} is missing a key"
        else
            byr_valid.call(hsh)
            iyr_valid.call(hsh)
            eyr_valid.call(hsh)
            hgt_valid.call(hsh)
            hcl_valid.call(hsh)
            ecl_valid.call(hsh)
            pid_valid.call(hsh)
            tests.length == 7 ? valids += 1 : invalids += 1
            tests = []
        end
    end
    p valids
end

run_tests.call(hash_arr)