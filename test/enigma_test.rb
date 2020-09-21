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

  def test_it_can_take_a_default_of_todays_date
    skip
    enigma = Enigma.new({message: "hello end",key: "02938"})
    Date.stubs(:today).returns(Date.new(2020,9,19))
    assert_equal "190920", enigma.date
  end

  def test_it_can_take_a_default_random_key
    skip
    enigma = Enigma.new({message: "hello end"})
    enigma.stubs(:rand).returns(1234)
    assert_equal "01234", enigma.key
  end

  def test_it_can_create_final_shifts
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    #shift.shifts = [3, 29, 95, 43], @alphabet.size = 27
    assert_equal [3, 2, 14, 16], enigma.final_shifts
  end

  def test_message_to_nums
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = [7,4,11,11,14,26,22,14,17,11,3]
    assert_equal expected, enigma.message_to_nums
  end

  def test_apply_encode_shift
    skip
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = [10,4,3,4,17,26,14,7,20,11,22]
    assert_equal expected, enigma.encode_shift
  end

  def test_it_can_encode_a_message
    skip
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    assert_equal "keder ohulw", enigma.encode_message
  end

  def test_it_can_encrypt
    skip
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt
  end

  def test_it_can_apply_decode_shift
    skip
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = [7,4,11,11,14,26,22,14,17,11,3]
    assert_equal expected, enigma.decode_shift
  end







end
