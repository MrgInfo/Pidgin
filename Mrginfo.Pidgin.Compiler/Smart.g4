grammar Smart;

import Numeric;

tokens { BeginString, EndString, Decorator, PathSeparator, To, Length }

//                                  CHAR      ASC        BIN
fragment BeginString            :  '[' ; //    91  1110 1010
fragment EndString              :  ']' ; //    93  1110 1011
fragment Decorator              :  '_' ; //    95  1110 1100
fragment PathSeparator          : '\\' ; //    92     10 100
fragment To                     :  '>' ; //    62     10 101
fragment Length                 :  '#' ; //    35     10 110

SomeText                        : .+?
                                ;

// String sugar (empty = [])
string                          : BeginString EndString
                                | BeginString SomeText EndString
                                | Decorator BeginString SomeText EndString Decorator
                                | Decorator Decorator BeginString SomeText EndString Decorator Decorator
                                | Decorator Decorator Decorator BeginString SomeText EndString Decorator Decorator Decorator
                                | Decorator Decorator Decorator Decorator BeginString SomeText EndString Decorator Decorator Decorator Decorator
                                ;

// Octet stream sugar
slice                           : numeric To numeric
                                | numeric Length numeric
                                ;

// Reference sugar [\1\2 -> key, \1\2\ -> value ]
// non human readable but easy to follow
path                            : PathSeparator ( numeric PathSeparator )* numeric PathSeparator?
                                ;

composite                       : array
                                | fraction
                                | decimal
                                | string
                                | slice
                                | path
                                ;
