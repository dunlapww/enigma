require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("hello end", "02938", "040895")
    assert_instance_of Enigma, enigma
  end



end
