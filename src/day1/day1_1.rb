input = File.readlines('../res/day1.input').map(&:to_i)

output = input
           .combination(2)
           .select { |x, y| x + y == 2020 }
           .flatten
           .inject(:*)

puts output