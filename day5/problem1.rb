ids = Array.new

File.open("input.txt", "r") do |f|
    f.each_line do |line|
        row = line[0..6]
        seat = line[7..9]

        row_range = (0..127)
        row_first = row_range.first
        row_final = row_range.last
        row_mid = (row_final - row_first) / 2
        row_front = (row_first..row_mid)
        row_back = (row_mid + 1..row_final)
        
        seat_range = (0..7)
        seat_first = seat_range.first
        seat_final = seat_range.last
        seat_mid = (seat_final - seat_first) / 2
        seat_front = (seat_first..seat_mid)
        seat_back = (seat_mid + 1..seat_final)

        row.each_char do |char|
            char == 'F' ? row_range = row_front : row_range = row_back
            row_first = row_range.first
            row_final = row_range.last
            row_mid = ((row_final - row_first) / 2).to_f.floor
            row_front = (row_first...(row_first + row_mid))
            row_back = ((row_first + row_mid + 1)...row_final)
        end

        seat.each_char do |char|
            char == 'L' ? seat_range = seat_front : seat_range = seat_back
            seat_first = seat_range.first
            seat_final = seat_range.last
            seat_mid = ((seat_final - seat_first) / 2).to_f.floor
            seat_front = (seat_first..(seat_first + seat_mid))
            seat_back = ((seat_first + seat_mid + 1)..seat_final)
        end

        find_row = lambda do |row|
            c = row[-1]
            low = row_range.first
            high = row_range.last
            c == 'F' ? row = low : row = high
        end
          
        find_seat = lambda do |seat|
            c = seat[-1]
            low = seat_range.first
            high = seat_range.last
            c == 'L'? seat = low : seat = high
        end
          
        find_id = lambda do |row, seat|
            id_row = find_row.call(row)
            id_seat = find_seat.call(seat)
            id = (id_row.to_i * 8) + id_seat
            ids << id
        end
          
        find_id.call(row, seat)
    end
end

highest_id = ids.sort.last

puts "The highest id is #{highest_id}."