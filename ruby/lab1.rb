
inputs = []
# input = gets.chomp
# while input != ""
#   inputs << input
#   input = gets.chomp
# end

loop do
  input = gets.chomp
  break if input == ''
  inputs << input
end

int_strings = inputs.find_all {|x| x =~ /\A\d+\Z/}

ints = int_strings.map {|s| s.to_i}

cubes = ints.map {|i| i * i * i}

puts cubes

p (1..1001).find_all {|x| x % 3 == 0 or x % 5 == 0}
