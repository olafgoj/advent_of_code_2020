# frozen_string_literal: true

input = File.readlines('../../res/day4/day4.input')

REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].freeze

passport = ''
passports = []

input.each do |line|
  if line == "\n"
    passports.push(passport)
    passport = ''
  else
    passport += line.delete("\n")
  end
end
passports.push(passport)

output = passports
           .select { |passport| REQUIRED_FIELDS.all? { |field| passport.include? field } }
           .count

puts output
