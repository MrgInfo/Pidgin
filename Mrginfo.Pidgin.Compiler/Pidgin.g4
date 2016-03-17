grammar Pidgin;

tokens 
{ 
    Space, NewLine, White,
    BeginDelimiter, EndDelimiter, ListSeparator, PairSeparator, Minus, Digit 
}
                                        //  ASC       BIN
fragment Space          : ' ' ;         //   32	       00
fragment NewLine        : '\n' ;        //   10	       01
fragment ListSeparator  : ',' ;         //   44       100
fragment PairSeparator  : ':' ;         //   58       101
fragment BeginDelimiter : '{' ;         //  123      1100
fragment EndDelimiter   : '}' ;         //  125      1101
fragment Minus          : '-' ;         //   45  111 0001
fragment Digit          : '0'..'9' ;    //   48  111 0001
                                        //   57  111 1011

fragment White  : ( Space | NewLine )*
                ;

Number	: Minus? Digit+
	    ;


value 	: Number
	| array 
	;

item	: value ( White? ':' White? value )?
	;

array	: BeginDelimiter White? ( item ( White? ',' White? item )* White? )? EndDelimiter
	;


// Start rule
message	: array
	;

// Hexadecimal sugar
// Binary sugar
// DateTime sugar
// Fraction sugar
// Decimal sugar

// String sugar
// Binary sugar
// Reference sugar
