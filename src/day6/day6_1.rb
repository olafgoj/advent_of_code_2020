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
           .map { |array| array.join('')}
           .map { |item| item.chars.to_a.uniq.size }
           .sum

puts output
