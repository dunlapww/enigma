require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new()
    assert_instance_of Enigma, enigma
  end

  def test_it_can_format_random_number_with_leading_0
    enigma = Enigma.new()
    enigma.stubs(:rand).returns(1023)
    assert_equal "01023", enigma.encrypt("hello world")[:key]
  end

  def test_it_can_generate_a_date_in_correct_format
    Date.stubs(:today).returns(Date.new(2020, 9, 1))
    enigma = Enigma.new()
    assert_equal "010920", enigma.encrypt("hello world")[:date]
  end

  def test_it_can_encrypt
    enigma = Enigma.new()
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world","02715","040895")
  end

  def test_it_can_decrypt
    enigma = Enigma.new()
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw","02715","040895")
  end

  def test_it_can_crack
    enigma = Enigma.new()
    expected = {
      encryption: "hello world end",
      key: "08304",
      date: "291018"
    }
    assert_equal expected, enigma.crack("vjqtbeaweqihssi","291018")
  end
end
