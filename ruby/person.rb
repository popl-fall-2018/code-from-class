
class Person
  include Comparable

  attr_accessor :age
  attr_reader :name

  # def age
  #   @age
  # end

  # def age=(value)
  #   @age = value
  # end

  def initialize(full_name, age)
    @name = full_name
    @age = age
  end

  def introduce other_person
    puts "Hello #{other_person}, my name is #{@name}. I am #{@age} years old."
  end

  def birthday
    @age += 1
  end

  def to_s
    @name
  end

  def <=> (other_person)
    @name <=> other_person.name
  end

end
