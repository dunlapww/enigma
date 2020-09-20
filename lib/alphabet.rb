class Alphabet
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def size
    @letters.size
  end

  def num_to_alpha
    (0..size).zip(letters).to_h
  end

end
