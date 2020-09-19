require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_equal "hello end", enigma.message
    assert_equal "02938", enigma.key
    assert_equal "040895", enigma.date
  end



end
