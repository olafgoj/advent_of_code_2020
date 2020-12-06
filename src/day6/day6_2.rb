input = File.readlines('../../res/day6/day6.input')

groups = []
person_answers = []

input.each do |line|
  if line == "\n"
    groups.push(person_answers)
    person_answers = []
  else
    person_answers.push(line.delete("\n"))
  end
end
groups.push(person_answers)

output = groups
           .map {
             |group| group
                       .map { |it| it.chars }
                       .inject(:&) # this means arrays intersection (finding number of common elements)
                       .size
           }
           .sum

puts output