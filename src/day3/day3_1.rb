# frozen_string_literal: true

input = File.readlines('../../res/day3/day3.input')

TREE = '#'

LINE_LENGTH = 31
position = 0
line = 0
trees_encountered = 0

def go_right(position)
  (position + 3) % LINE_LENGTH
end

def is_tree?(character)
  character == TREE
end

def find_trees(input, line, position, trees_encountered)
  loop do
    position = go_right(position)
    line = line + 1
    current_char = input[line][position]
    if is_tree?(current_char)
      trees_encountered = trees_encountered + 1
    end
    if line == input.length - 1
      break
    end
  end
  trees_encountered
end

output = find_trees(input, line, position, trees_encountered)

puts output
