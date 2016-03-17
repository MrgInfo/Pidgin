grammar Numeric;

import Basic;

                                        //  ASC       BIN
fragment FractionSeparator  : '/' ;     //   47  110 1100
fragment DecimalPoint       : '.' ;     //   46  110 1101
fragment DateSeparator      : Minus ;   //   45  110 1110
fragment TimeSeparator      : ':' ;     //   58  110 1111
fragment TimePrefix         : 'T' ;     //   84
fragment UtcZero            : 'Z' ;     //   90

fragment Date               : Digit Digit Digit Digit DateSeparator Digit Digit DateSeparator Digit Digit ;
fragment Time               : Digit Digit TimeSeparator Digit Digit TimeSeparator Digit Digit ( UtcZero | ( Plus | Minus ) Digit Digit ( TimeSeparator Digit Digit )? ) ;

// ISO 8601 date
DateTime                    : Date ( TimePrefix Time )?
                            ;

// Hexadecimal sugar
// Binary sugar
// DateTime sugar
// Fraction sugar
// Decimal sugar

