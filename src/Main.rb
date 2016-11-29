require './Digit'

lexer = Digit::Lexer.new('123')
tokens = ANTLR3::CommonTokenStream.new(lexer)
print(tokens)