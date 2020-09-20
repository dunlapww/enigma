require './test/test_helper'

class AlphabetTest < Minitest::Test

  def test_it_exists
    alphabet = Alphabet.new
    assert_instance_of Alphabet, alphabet
  end
end
