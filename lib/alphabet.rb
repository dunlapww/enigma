class Alphabet
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def size
    @letters.size
  end

end
