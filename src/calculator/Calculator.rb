require_relative 'CalculatorGrammarLexer'
require_relative 'CalculatorGrammarParser'

module Calculator
  class Calculator
    @@instance = nil
    def self.instance
      if @@instance == nil
        @@instance = Calculator.new
      end
      return @@instance
    end

    def calculate(expr)
      lexer = CalculatorGrammar::Lexer.new(expr)
      parser = CalculatorGrammar::Parser.new(lexer)
      begin
        value = parser.evaluate
      rescue
        value = nil
      end
      value unless parser.syntax_errors?
    end
  end
end
