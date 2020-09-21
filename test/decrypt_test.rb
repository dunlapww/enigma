require './test/test_helper'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new("keder ohulw","02715","040895")
    assert_instance_of Decrypt, decrypt
  end

  def test_it_has_attributes
    decrypt = Decrypt.new("keder ohulw","02715","040895")
    assert_equal "keder ohulw", decrypt.message
    assert_equal "02715", decrypt.key
    assert_equal "040895", decrypt.date
  end

  def test_message_to_nums
    decrypt = Decrypt.new("keder ohulw","02715","040895")
    expected = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]
    assert_equal expected, decrypt.message_to_nums
  end

  def test_apply_decode_shift
    decrypt = Decrypt.new("keder ohulw","02715","040895")
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    assert_equal expected, decrypt.decode_shift
  end

  def test_it_can_decode_a_message
    decrypt = Decrypt.new("keder ohulw","02715","040895")
    assert_equal "hello world", decrypt.decode_message
  end
end
