require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new("hello world", "02715", "040895")
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    encrypt = Encrypt.new("hello world","02938","040895")
    assert_equal "hello world", encrypt.message
    assert_equal "02938", encrypt.key
    assert_equal "040895", encrypt.date
  end

  def test_it_can_take_a_default_of_todays_date
    skip
    encrypt = Encrypt.new("hello world","02938","040895")
    Date.stubs(:today).returns(Date.new(2020,9,19))
    assert_equal "190920", encrypt.date
  end

  def test_it_can_take_a_default_random_key
    skip
    encrypt = Encrypt.new({message: "hello world"})
    assert_equal "01234", encrypt.key
  end

  def test_message_to_nums
    encrypt = Encrypt.new("hello world","02938","040895")
    expected = [7,4,11,11,14,26,22,14,17,11,3]
    assert_equal expected, encrypt.message_to_nums
  end

  def test_apply_encode_shift
    encrypt = Encrypt.new("hello world","02715","040895")
    expected = [10,4,3,4,17,26,14,7,20,11,22]
    assert_equal expected, encrypt.encode_shift
  end

  def test_it_can_encode_a_message
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    assert_equal "keder ohulw", enigma.encode_message
  end
end
