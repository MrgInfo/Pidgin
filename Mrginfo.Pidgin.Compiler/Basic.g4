grammar Basic;

//                                    ASC       BIN
fragment Space          : ' ' ;  //    32       0 0
fragment NewLine        : '\n' ; //    10       0 1
fragment ListSeparator  : ',' ;  //    44     10 00
fragment PairSeparator  : '=' ;  //    61     10 01
fragment BeginDelimiter : '{' ;  //   123     10 10
fragment EndDelimiter   : '}' ;  //   125     10 11
fragment Plus           : '+' ;  //    43  110 0000
fragment Minus          : '-' ;  //    45  110 0001
fragment Digit          : '0'    //    48  110 0010
                        | '1'    //    49  110 0011
                        | '2'    //    50  110 0100
                        | '3'    //    51  110 0101
                        | '4'    //    52  110 0110
                        | '5'    //    53  110 0111
                        | '6'    //    54  110 1000
                        | '7'    //    55  110 1001
                        | '8'    //    56  110 1010
                        | '9'    //    57  110 1011
                        ;

fragment White  : ( Space | NewLine )*
                ;

Number  : Minus? Digit+
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

// String sugar
// Binary sugar
// Reference sugar
