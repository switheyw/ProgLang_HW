use "dates.sml";



31 = sum_first_N(1);
59 = sum_first_N(2);
365 = sum_first_N(12);

397 = doy( (1,1,1) );
398 = doy( (1,2,1));

false = is_older( (11,22,2013), (11,21,2013) );
false = is_older( (11,22,2013), (11,22,2013) );
true  = is_older( (11,22,2013), (11,23,2013) );
true  = is_older( (11,22,2013), (12,01,2013) );

val dts = [ (11,11,1947), (11,14,2001), (12,25,2013), (11,11,1111) ];

3 = number_in_month(dts, 11);
1 = number_in_month(dts, 12);
0 = number_in_month(dts, 3);

[3,1,0] = number_in_months( dts, [11,12,3]);
[3,3,0] <> number_in_months( dts, [11,12,3]);

