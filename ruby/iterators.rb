
def do_twice
  yield
  yield
end

do_twice {puts "Ruby"}

sum = 0
do_twice {sum += 100}
puts sum

def odd_numbers_below(top)
  num = 1
  while num < top
    yield num
    num += 2
  end
end

odd_numbers_below(30) {|x| puts x}


def multiple_parameters
  yield 1, 2, 3
end

multiple_parameters {|x, y, z| puts x + y + z}

class Colors
  include Enumerable

  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "purple"
  end
end


