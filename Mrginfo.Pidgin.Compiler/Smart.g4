grammar Smart;

import Numeric;

//                                  CHAR      ASC        BIN
fragment BeginString            :  '[' ; //    91  1110 1010
fragment EndString              :  ']' ; //    93  1110 1011
Decorator                       :  '_' ; //    95  1110 1100
PathSeparator                   : '\\' ; //    92     10 100
To                              :  '>' ; //    62     10 101
At                              :  '@' ; //    64     10 110
fragment SomeText               :  .+? ;

// String sugar (empty = [])
String                          : BeginString EndString
                                | BeginString SomeText EndString
                                | Decorator BeginString SomeText EndString Decorator
                                | Decorator Decorator BeginString SomeText EndString Decorator Decorator
                                | Decorator Decorator Decorator BeginString SomeText EndString Decorator Decorator Decorator
                                | Decorator Decorator Decorator Decorator BeginString SomeText EndString Decorator Decorator Decorator Decorator
                                ;

// Octet stream sugar
slice                           : numeric To numeric
                                | numeric At numeric
                                ;

// Reference sugar [\1\2 -> key, \1\2\ -> value ]
// non human readable but easy to follow
path                            : PathSeparator ( numeric PathSeparator )* numeric PathSeparator?
                                ;

composite                       : array
                                | fraction
                                | Decimal
                                | String
                                | slice
                                | path
                                ;
