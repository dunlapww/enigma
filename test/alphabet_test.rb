require './test/test_helper'

class AlphabetTest < Minitest::Test

  def test_it_exists
    alphabet = Alphabet.new
    assert_instance_of Alphabet, alphabet
  end

  def test_it_has_attributes
    alphabet = Alphabet.new
    assert_equal ("a".."z").to_a << " ", alphabet.letters
  end
end
