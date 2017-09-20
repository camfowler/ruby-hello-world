class HelloWorld

  def self.say_hi
    "Hello everyone!"
  end

end



require 'minitest/autorun'

class TestHelloWorld < MiniTest::Unit::TestCase

  def test_that_hello_world_is_friendly
    assert_equal "Hello everyone!", HelloWorld.say_hi
  end

end
