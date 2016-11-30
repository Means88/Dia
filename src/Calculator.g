grammar Calculator;

options {
  language = Ruby;
}

expression returns[value]
  : a=INTEGER ADD b=INTEGER { $value = $a.text.to_i + $b.text.to_i }
  | a=INTEGER SUB b=INTEGER { $value = $a.text.to_i - $b.text.to_i }
  ;

INTEGER: ('0'..'9')+;
ADD: '+';
SUB: '-';
WS: (' ' | '\t' | '\r' | '\n')+ { $channel = HIDDEN };
