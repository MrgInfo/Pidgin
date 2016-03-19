grammar Numeric;

import Basic;

//                                  CHAR      ASC        BIN
fragment Hex                    :  Digit
                                |  'A'    //    65   110 1010
                                |  'B'    //    66   110 1011
                                |  'C'    //    67   110 1100
                                |  'D'    //    68   110 1101
                                |  'E'    //    69   110 1110
                                |  'F'    //    70   110 1111
                                ;
FractionSeparator               :  '/' ;  //    47  1110 0010
DecimalPoint                    :  '.' ;  //    46  1110 0011
fragment TimeSeparator          :  ':' ;  //    58  1110 0100
fragment TimePrefix             :  'T' ;  //    84  1110 0101
fragment UtcZero                :  'Z' ;  //    90  1110 0110
fragment BinPrefix              :  'b' ;  //    98  1110 0111
fragment HexPrefix              :  'h' ;  //   104  1110 1000
ExponentPrefix                  :  'e' ;  //   101  1110 1001

// Semantic error can occur!
fragment Date               : Digit Digit Digit Digit Minus Digit Digit Minus Digit Digit
                            ;
// Semantic error can occur!
fragment Time               : Digit Digit TimeSeparator Digit Digit TimeSeparator Digit Digit ( UtcZero | ( Plus | Minus ) Digit Digit ( TimeSeparator Digit Digit )? )?
                            ;

// Binary sugar
BinNumber                   : ( Plus | Minus )? BinPrefix Bit+
                            ;

// Hexadecimal sugar
HexNumber                   : ( Plus | Minus )? HexPrefix Hex+
                            ;

// DateTime sugar (ISO 8601 date)
DateTime                    : Date ( TimePrefix Time )?
                            ;

// Decimal sugar
Decimal                     : ( Plus | Minus )? Digit* DecimalPoint Digit+ ( ExponentPrefix ( Plus | Minus )? Digit+ )?
                            | Digit+ ExponentPrefix ( Plus | Minus )? Digit+
                            ;

// Fraction sugar
fraction                    : numeric FractionSeparator numeric
                            ;

numeric                     : BinNumber
                            | DecNumber
                            | HexNumber
                            | DateTime
                            ;

composite                   : array
                            | fraction
                            | Decimal
                            ;
