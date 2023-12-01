$!=('0'..'9')>>.uniname>>.words>>[1]>>.lc;lines>>.&{m:ov/\d|<{$![1..*]}>/[0,*-1]>>.&{$!.first(~$_,:k)||$_}.join}.sum.put
