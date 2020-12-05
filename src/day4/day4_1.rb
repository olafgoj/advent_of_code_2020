input = File.readlines('../../res/day4/day4.input')

REQUIRED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

passport = ""
passports = []

input.each do |line|
  if line == "\n"
    passports.push(passport)
    passport = ""
  else
    passport = passport + line.delete("\n")
  end
end
passports.push(passport)

output = passports
             .select { |passport| REQUIRED_FIELDS.all? { |field| passport.include? field } }
             .count

puts output