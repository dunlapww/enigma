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

  def test_it_can_create_keys
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_equal [2, 29, 93, 38], enigma.keys
  end

  def test_it_can_take_a_default_of_todays_date
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

  def test_it_can_return_square_of_date_as_string
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    assert_equal "1672401025", enigma.square_date
  end

  def test_it_can_convert_squared_date_to_array_of_ints
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    enigma.stubs(:square_date).returns("102035423")
    assert_equal [1,0,2,0,3,5,4,2,3], enigma.squared_date_nums
  end

  def test_it_can_create_offsets
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:square_date).returns("102035423")
    assert_equal [5, 4, 2, 3], enigma.offsets
  end

  def test_it_can_create_raw_shifts
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:offsets).returns([5,4,2,3])
    enigma.stubs(:keys).returns([2,26,15,47])
    assert_equal [7,30,17,50], enigma.raw_shifts
  end

  def test_it_can_create_final_shifts
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:offsets).returns([5,4,2,3])
    enigma.stubs(:keys).returns([2,26,15,47])
    assert_equal [7,3,17,23], enigma.final_shifts
  end


  def test_num_to_alpha
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = {
      0 => "a",
      1 => "b",
      2 => "c",
      3 => "d",
      4 => "e",
      5 => "f",
      6 => "g",
      7 => "h",
      8 => "i",
      9 => "j",
      10 => "k",
      11 => "l",
      12 => "m",
      13 => "n",
      14 => "o",
      15 => "p",
      16 => "q",
      17 => "r",
      18 => "s",
      19 => "t",
      20 => "u",
      21 => "v",
      22 => "w",
      23 => "x",
      24 => "y",
      25 => "z",
      26 => " "
    }
    assert_equal expected, enigma.num_to_alpha
  end

  def test_num_to_alpha
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = {
      "a" => 0,
      "b" => 1,
      "c" => 2,
      "d" => 3,
      "e" => 4,
      "f" => 5,
      "g" => 6,
      "h" => 7,
      "i" => 8,
      "j" => 9,
      "k" => 10,
      "l" => 11,
      "m" => 12,
      "n" => 13,
      "o" => 14,
      "p" => 15,
      "q" => 16,
      "r" => 17,
      "s" => 18,
      "t" => 19,
      "u" => 20,
      "v" => 21,
      "w" => 22,
      "x" => 23,
      "y" => 24,
      "z" => 25,
      " " => 26
    }
    assert_equal expected, enigma.alpha_to_num
  end

  def test_message_to_nums
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = [7,4,11,11,14,26,22,14,17,11,3]
    assert_equal expected, enigma.message_to_nums
  end

  def test_apply_final_shift
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = [10,4,3,4,17,26,14,7,20,11,22]
    assert_equal expected, enigma.encode_shift
  end

  def test_it_can_encode_a_message
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    assert_equal "keder ohulw", enigma.encode_message
  end

  def test_it_can_encrypt
    enigma = Enigma.new({message: "hello world",key: "02715",date: "040895"})
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt
  end







end
