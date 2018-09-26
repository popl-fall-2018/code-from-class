
# We want to pass 2 code blocks to a method
# Answer: proc
# proc: object form of a code block

def calls_two_procs(arg, proc1, proc2)
  result1 = proc1.call(arg)
  result2 = proc2.call(result1)
  return result2
end

squares = Proc.new {|x| x * x}
adds5 = Proc.new {|y| y + 5}

#puts calls_two_procs(10, squares, adds5)

def stores_proc(arg, &proc)
  proc.call(arg)
end

#puts stores_proc("hi there class") {|s| s.upcase}


class Object

  # def method_missing(method_name, *args, &block)
  #   puts "Hey, the #{method_name.inspect} method doesn't exist!"
  #   puts "You called it on the object #{self.inspect}, which is of the class #{self.class}."
  #   puts "The args: #{args}"
  #   puts "The block: #{block}"
  # end

  def method_missing(missing_method_symbol, *args, &block)
    missing_method_string = missing_method_symbol.to_s

    replacement_method_symbol = self.methods.sort.find do |method|
      missing_method_string[method.to_s]
    end

    puts "#{missing_method_symbol.inspect} method being replaced by #{replacement_method_symbol.inspect}"

    if replacement_method_symbol
      self.send(replacement_method_symbol, *args, &block)
    end

  end

end
