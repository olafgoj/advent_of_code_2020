input = File.readlines('../../res/day5/day5.input')

class BoardingPass
  NUMBER_OF_ROWS = 128
  NUMBER_OF_COLUMNS = 8

  ROW_CODE_LENGTH = 7
  COLUMN_CODE_LENGTH = 3

  ROW_LOWER_HALF_CHAR = 'F'
  ROW_UPPER_HALF_CHAR = 'B'
  COLUMN_LOWER_HALF_CHAR = 'L'
  COLUMN_UPPER_HALF_CHAR = 'R'

  attr_reader :row_code
  attr_reader :column_code
  attr_reader :row
  attr_reader :column
  attr_reader :id

  def initialize(item)
    @row_code = item[0..ROW_CODE_LENGTH-1].split('')
    @column_code = item[ROW_CODE_LENGTH..-1].split('')
    @row = get_row_number
    @column = get_column_number
    @id = calculate_id
  end

  private

  def get_half(array)
    array.length / 2
  end

  def take_lower_half(array)
    half = get_half(array)
    array.slice(0, half)
  end

  def take_upper_half(array)
    half = get_half(array)
    array.slice(half, array.length)
  end

  def get_array_of_rows
    Array(0..NUMBER_OF_ROWS-1)
  end

  def get_array_of_columns
    Array(0..NUMBER_OF_COLUMNS-1)
  end

  def get_row_number
    rows = get_array_of_rows
    @row_code.each do |char|
      if char == ROW_LOWER_HALF_CHAR
        rows = take_lower_half(rows)
      end
      if char == ROW_UPPER_HALF_CHAR
        rows = take_upper_half(rows)
      end
    end
    rows.first
  end

  def get_column_number
    columns = get_array_of_columns
    @column_code.each do |char|
      if char == COLUMN_LOWER_HALF_CHAR
        columns = take_lower_half(columns)
      end
      if char == COLUMN_UPPER_HALF_CHAR
        columns = take_upper_half(columns)
      end
    end
    columns.first
  end

  def calculate_id
    @row * 8 + @column
  end
end

output = input
           .map { |line| BoardingPass.new(line)}
           .map { |pass| pass.id.to_i }
           .max

puts output