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

  def test_message_to_nums
    encrypt = Encrypt.new("hello world","02938","040895")
    expected = [7,4,11,11,14,26,22,14,17,11,3]
    assert_equal expected, encrypt.message_to_nums
  end

  def test_it_can_create_encode_shift
    encrypt = Encrypt.new("hello world","02715","040895")
    expected = [3, 27, 73, 20]
    assert_equal expected, encrypt.encode_shift
  end


  def test_apply_encode_shift
    encrypt = Encrypt.new("hello world","02715","040895")
    expected = [10,4,3,4,17,26,14,7,20,11,22]
    assert_equal expected, encrypt.apply_shift(encrypt.encode_shift)
  end

  def test_it_can_encode_a_message
    encrypt = Encrypt.new("he$llo world!","02715","040895")
    assert_equal "ke$der ohulw!", encrypt.translate_message(encrypt.encode_shift)
  end
end
