# frozen_string_literal: true

class PasswordPolicy
  attr_reader :first_position, :second_position, :character, :password

  def initialize(item)
    range = item.split(' ')[0].split('-').map(&:to_i)
    @first_position = range[0]
    @second_position = range[1]
    @character = item.split(' ')[1].tr(':', '')
    @password = item.split(' ')[2]
  end

  def is_valid?
    is_first_position_valid = @password[@first_position - 1] == @character
    is_second_position_valid = @password[@second_position - 1] == @character
    is_first_position_valid ^ is_second_position_valid
  end
end

input = File.readlines('../../res/day2/day2.input')

output = input
         .map { |item| PasswordPolicy.new(item) }
         .filter(&:is_valid?)
         .count

puts output
