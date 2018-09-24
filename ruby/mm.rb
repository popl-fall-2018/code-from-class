
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

puts calls_two_procs(10, squares, adds5)

def stores_proc(arg, &proc)
  proc.call(arg)
end

puts stores_proc("hi there class") {|s| s.upcase}

