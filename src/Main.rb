require './CalculatorParser'

parser = Calculator::Parser.new('1 + 1')
print(parser.expression)
