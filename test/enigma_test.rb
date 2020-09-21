require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new()
    assert_instance_of Enigma, enigma
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


  # def test_it_can_encode_a_message
  #   skip
  #   enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
  #   assert_equal "keder ohulw", enigma.encode_message
  # end
  #
  #
  #
  # def test_it_can_apply_decode_shift
  #   skip
  #   enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
  #   expected = [7,4,11,11,14,26,22,14,17,11,3]
  #   assert_equal expected, enigma.decode_shift
  # end







end
