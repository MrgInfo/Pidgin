grammar Basic;

//                                  CHAR      ASC        BIN
fragment Space                  :  ' ' ; //    32        0 0
fragment NewLine                : '\n' ; //    10        0 1
ListSeparator                   :  ',' ; //    44     10 000
PairSeparator                   :  '=' ; //    61     10 001
Begin                           :  '{' ; //   123     10 010
End                             :  '}' ; //   125     10 011
fragment Plus                   :  '+' ; //    43  1110 0000
fragment Minus                  :  '-' ; //    45  1110 0001
fragment Bit                    :  '0'   //    48   110 0000
                                |  '1'   //    49   110 0001
                                ;
fragment Digit                  :  Bit
                                |  '2'   //    50   110 0010
                                |  '3'   //    51   110 0011
                                |  '4'   //    52   110 0100
                                |  '5'   //    53   110 0101
                                |  '6'   //    54   110 0110
                                |  '7'   //    55   110 0111
                                |  '8'   //    56   110 1000
                                |  '9'   //    57   110 1001
                                ;

DecNumber                       : ( Plus | Minus )? Digit+
                                ;

// Ignore whitespaces
White                           : ( Space | NewLine )+ -> skip
                                ;

// Start rule
message                         : array
                                ;

array                           : Begin White? ( item ( White? ListSeparator White? item )* White? )? End
                                ;

item                            : value ( White? PairSeparator White? value )?
                                ;

value                           : numeric
                                | composite
                                ;

numeric                         : DecNumber
                                ;

composite                       : array
                                ;
