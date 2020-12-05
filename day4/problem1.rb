contents = ''
count = 0
valids = 0
invalids = 0
passports = Array.new
missing = Array.new

keys = [
  "byr",
  "iyr",
  "eyr",
  "hgt",
  "hcl",
  "ecl",
  "pid",
  "cid"
]

File.open("input.txt", "r") do |f|
    f.each_line do |line|
        contents << line 
    end
    passports = contents.split(/\n{2}/)
end

passports.each do |passport|
    keys.each do |key|
        passport.include?(key) ? count += 1 : missing << key
    end
    if missing.empty? || missing.length == 1 && missing[0] == 'cid'
        valids += 1
    else
        invalids += 1
    end
    valids
    invalids
    missing = []
end

p valids