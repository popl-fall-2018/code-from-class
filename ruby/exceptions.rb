
class MeanOfEmptyArrayError < ZeroDivisionError
  
  def initialize(array)
    @array = array
  end
  
  def to_s
    "Man, why did you try to find the mean of an empty array??? Here it is you dummy: #{@array}"
  end
end

def mean(numbers)
  if numbers.empty?
    raise MeanOfEmptyArrayError.new(numbers)
  end
  numbers.sum / numbers.length
end

=begin
nums = []

begin
  puts 'Enter some integers; leave line blank to stop'

  while gets.chomp != ""
    nums << $_.chomp.to_i
  end

  puts "Mean is: #{mean(nums)}"

rescue ZeroDivisionError => problem
  puts "You can't find the mean of zero numbers!!!!"
  puts problem

  # retry

rescue MeanOfEmptyArrayError
  puts "we're now here!"

end
=end

def print_big_no_space char
  # Throw if char == " ", otherwise print it uppercase
  throw :hit_a_space if char == " "
  throw :something_else if char == "s"
  puts char.upcase
end

catch :something_else do
  catch :hit_a_space do
    puts "Enter a string:"
    string = gets.chomp
    string.each_char {|c| print_big_no_space c}
  end
  print "woooo"
end
