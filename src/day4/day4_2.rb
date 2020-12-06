input = File.readlines('../../res/day4/day4.input')

REQUIRED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
EYE_COLORS = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

passport = ""
passports = []

input.each do |line|
  if line == "\n"
    passports.push(passport)
    passport = ""
  else
    passport = passport + line.delete("\n") + " "
  end
end
passports.push(passport)

passports = passports
              .select { |passport| REQUIRED_FIELDS.all? { |field| passport.include? field } }

output = passports
           .map { |pass| pass.split(" ") }

new_list = []
output.each do |item|
  dict = {}
  item.each do |prop|
    split = prop.split(":")
    dict[split[0]] = split[1]
  end
  new_list.push(dict)
end

output = new_list
           .filter { |it| it['byr'].to_i.between?(1920, 2002) }
           .filter { |it| it['iyr'].to_i.between?(2010, 2020) }
           .filter { |it| it['eyr'].to_i.between?(2020, 2030) }
           .filter { |it| it['hgt'].match?('^((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in)$') }
           .filter { |it| it['hcl'].match?('^#[0-9a-f]{6}$') }
           .filter { |it| EYE_COLORS.include? it['ecl'] }
           .filter { |it| it['pid'].match?('^[0-9]{9}$') }
           .count

puts output
