require 'minitest/autorun'
require_relative '../../src/calculator/Calculator'

class TestCalculator < Minitest::Test
  def setup
    @calculator = Calculator::Calculator.instance
  end

  def test_integer
    assert_equal 123, @calculator.calculate('123')
    assert_equal -233, @calculator.calculate('-233')
  end

  def test_decimal
    assert_in_delta 3.1415926, @calculator.calculate('3.1415926'), 1e-6
    assert_in_delta -2.5252, @calculator.calculate('-2.5252'), 1e-6
  end

  def test_add
    assert_equal 3, @calculator.calculate('1 + 2')
    assert_equal -1, @calculator.calculate('1 + (-2)')
    assert_equal -1, @calculator.calculate('-2 + 1')
    assert_equal 3, @calculator.calculate('1+2')
  end

  def test_sub
    assert_equal -2, @calculator.calculate('1 - 3')
    assert_equal -2, @calculator.calculate('1-3')
    assert_equal 4, @calculator.calculate('1 - (-3)')
  end

  def test_mul
    assert_equal 12, @calculator.calculate('3*4')
    assert_equal 12, @calculator.calculate('3 * 4')
    assert_equal 12, @calculator.calculate('3 * +4')
    assert_equal -12, @calculator.calculate('3*(-4)')
    assert_equal -12, @calculator.calculate('3 * -4')
    assert_equal -12, @calculator.calculate('3*-4')
  end

  def test_div
    assert_equal 3, @calculator.calculate('12/4')
    assert_equal 3, @calculator.calculate('12 / 4')
    assert_equal 2, @calculator.calculate('10 / 4')
    assert_in_delta 2.5, @calculator.calculate('10.0 / 4'), 1e-6
    assert_in_delta 2.5, @calculator.calculate('10.0/4'), 1e-6
    assert_equal -3, @calculator.calculate('12 / (-4)')
    assert_in_delta -2.5, @calculator.calculate('-10.0 / 4'), 1e-6
  end

  def test_add_sub
    assert_equal 0, @calculator.calculate('1 + 2 - 3')
    assert_equal 2, @calculator.calculate('1 - 2 + 3')
  end

  def test_mul_div
    assert_equal 4, @calculator.calculate('2 * 6 / 3')
    assert_equal 0, @calculator.calculate('2 / 3 * 6')
    assert_in_delta 4, @calculator.calculate('2.0 / 3 * 6'), 1e-6
  end

  def test_parent
    assert_equal 12, @calculator.calculate('(12)')
    assert_equal -3, @calculator.calculate('(-3)')
    assert_equal -4, @calculator.calculate('1 - (2 + 3)')
    assert_equal 2, @calculator.calculate('(1 - 2) + 3')
    assert_equal 6, @calculator.calculate('(3 / 2) * 6')
    assert_equal 0, @calculator.calculate('3 / (2 * 6)')
  end

  def test_add_mul
    assert_equal 7, @calculator.calculate('1 + 2 * 3')
    assert_equal 5, @calculator.calculate('1 * 2 + 3')
    assert_equal 9, @calculator.calculate('(1 + 2) * 3')
  end

  def test_add_div
    assert_equal 1, @calculator.calculate('1 + 2 / 3')
    assert_equal 5, @calculator.calculate('2 / 1 + 3')
    assert_equal 1, @calculator.calculate('(1 + 2) / 3')
  end

  def test_sub_mul
    assert_equal -1, @calculator.calculate('2 - 1 * 3')
    assert_equal -1, @calculator.calculate('1 * 2 - 3')
    assert_equal -3, @calculator.calculate('(1 - 2) * 3')
  end

  def test_sub_div
    assert_equal 1, @calculator.calculate('1 + 2 / 3')
    assert_equal 5, @calculator.calculate('2 / 1 + 3')
    assert_equal 1, @calculator.calculate('(1 + 2) / 3')
  end

  def test_all
    assert_equal 18, @calculator.calculate('(1 + 2) * (3 * (4 - 2))')
    assert_in_delta -0.1428571428, @calculator.calculate('(2 - 3.0) / (1 + 2 * 3)'), 1e-6
  end

  def test_error
    assert_nil @calculator.calculate('(1')
    assert_nil @calculator.calculate(')(')
    assert_nil @calculator.calculate('1++')
    assert_nil @calculator.calculate('1)')
  end
end
