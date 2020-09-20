class Alphabet
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def size
    @letters.size
  end

  def num_to_alpha
    (0..size - 1).zip(letters).to_h
  end

  def alpha_to_num
    num_to_alpha.invert
  end

end
