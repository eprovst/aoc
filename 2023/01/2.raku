$!=('0'..'9')».uniname».words»[1]».lc;put sum ((map {$!.first(~$_,:k)||$_},m:ov/\d|<{$![1..*]}>/).&{.[0]~.[*-1]} for lines);
