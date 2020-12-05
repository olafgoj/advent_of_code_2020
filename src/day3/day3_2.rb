# frozen_string_literal: true

input = File.readlines('../../res/day3/day3.input')

TREE = '#'

LINE_LENGTH = 31
position = 0
line = 0
trees_encountered = 0

def go_right(position, move_length)
  (position + move_length) % LINE_LENGTH
end

def is_tree?(character)
  character == TREE
end

def find_trees(input, line, position, trees_encountered, right_move_length, down_move_length)
  loop do
    position = go_right(position, right_move_length)
    line = line + down_move_length
    current_char = input[line][position]
    if is_tree?(current_char)
      trees_encountered = trees_encountered + 1
    end
    if line >= input.length - 1
      break
    end
  end
  trees_encountered
end

right_1_down_1 = find_trees(input, line, position, trees_encountered, 1, 1)
right_3_down_1 = find_trees(input, line, position, trees_encountered, 3, 1)
right_5_down_1 = find_trees(input, line, position, trees_encountered, 5, 1)
right_7_down_1 = find_trees(input, line, position, trees_encountered, 7, 1)
right_1_down_2 = find_trees(input, line, position, trees_encountered, 1, 2)

output = right_1_down_1 * right_3_down_1 * right_5_down_1 * right_7_down_1 * right_1_down_2

puts output
