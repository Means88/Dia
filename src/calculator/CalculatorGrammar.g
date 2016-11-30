grammar CalculatorGrammar;

options {
  language = Ruby;
}

evaluate returns[value]: a=expression EOF { $value = $a.value };

expression returns[value]: a=mul(
    ADD b=mul { $a.value += $b.value }
  | SUB b=mul { $a.value -= $b.value }
  )* { $value = $a.value };

mul returns[value]: a=single(
    MUL b=single { $a.value *= $b.value }
  | DIV b=single { $a.value /= $b.value }
  )* { $value = $a.value };

single returns[value]
  : ADD? a=atom { $value = $a.value }
  | SUB a=atom { $value = -$a.value };

atom returns[value]
  : a=INTEGER { $value = $a.text.to_i }
  | a=DECIMAL { $value = $a.text.to_f }
  | LPARENT e=expression { $value = $e.value } RPARENT;

INTEGER: ('0'..'9')+;
DECIMAL: ('0'..'9')+ '.' ('0'..'9')+;
ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';
LPARENT: '(';
RPARENT: ')';
WS: (' ' | '\t' | '\r' | '\n')+ { $channel = HIDDEN };
