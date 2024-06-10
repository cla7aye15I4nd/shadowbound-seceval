( *a = () )
a.<<.take_while{ a.drop_while {Enumerable ; a<<lambda {}}}
