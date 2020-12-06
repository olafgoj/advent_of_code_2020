input = File.readlines('../res/day1.input').map(&:to_i)

output = input
           .combination(3)
           .select { |x, y, z| x + y + z == 2020 }
           .flatten
           .inject(:*)

puts output