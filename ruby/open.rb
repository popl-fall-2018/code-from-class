
# Open classes
# We can take existing classes and add behavior, even if we didn't create the class!

class String
  
  # Return true if the string is entirely made of capital letters
  def caps?
    if self =~ /\A[A-Z]*\Z/
      return true
    else
      return false
    end
  end
  
  def size
    17
  end

end


class Integer

  # Map a block of code over all square numbers between 0 and self.
  # Return an array of the results
  def map_over_squares
    x = 0
    results = []

    while x * x < self
      result = yield x * x
      results << result
      x += 1
    end
    
    return results
  end

  def + (other)
    self - other
  end

end
