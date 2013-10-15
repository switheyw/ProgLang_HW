use "dates.sml";

31 = sum_first_N(1);
59 = sum_first_N(2);
365 = sum_first_N(12);

397 = doy( (1,1,1) );
398 = doy( (1,2,1));

false = is_older( (11,22,2013), (11,21,2013) );





(*
    let
	val xs = countup(doy1, doy2)
	if null xs
	then mrs
	month_range_prime( countup_mrs : int list,  doy1: int) =
	else mrs :: what_month(doy1)
    in
	month_range_prime( countup(doy1, doy2) )
    end
*)

false = is_older( (11,22,2013), (11,22,2013) );
true  = is_older( (11,22,2013), (11,23,2013) );
true  = is_older( (11,22,2013), (12,01,2013) );
val dts = [ 
 (11,11,1947),
 (11,14,2001),
 (12,25,2013),
 (11,11,1111),
 (9,11,2001),
 (9,17,1947) ];

3 = number_in_month(dts, 11);
1 = number_in_month(dts, 12);
0 = number_in_month(dts, 3);

[] = number_in_months( dts, [1,2,7]);
[3,1,0] = number_in_months( dts, [11,12,3]);
[3,3,0] <> number_in_months( dts, [11,12,3]);
[3,1,0,2] = number_in_months( dts, [11,12,3,9]);

 [(11,11,1947),(11,14,2001),(11,11,1111)] = dates_in_month( dts, 11);

val ms = [ 11, 1, 7, 12, 9 ];

 [(11,11,1947),(11,14,2001),(11,11,1111),(12,25,2013),(9,11,2001),
   (9,17,1947)] = dates_in_months( dts, ms);

[] = dates_in_months( dts, [1,2,7] );


val ss = [ "aaa", "bbb", "ccc" ];
"aaa" = get_nth ( ss, 1);
"ccc" = get_nth(ss, 3);

"Dec 3, 2001" = date_to_string( (11, 3, 2001) );
"Mar 23, 2013" = date_to_string( (3, 23, 2013) );
val s = "homework 8 - number_before_reaching_sum.";
(* 31, 59, 90, 120, 150 *)
1 = number_before_reaching_sum (1, DaysPerMonth );
1 = number_before_reaching_sum (11, DaysPerMonth );
1 = number_before_reaching_sum (31, DaysPerMonth );
2 = number_before_reaching_sum (55, DaysPerMonth );
3 = number_before_reaching_sum (78, DaysPerMonth );
4 = number_before_reaching_sum (95, DaysPerMonth );

12 = number_before_reaching_sum (365, DaysPerMonth );
val s = "homework 9 - what_month.";
(* 31, 59, 90, 120, 150 *)
1 = what_month(1);
1 = what_month(31);
2 = what_month(32 );
2 = what_month(55);
2 = what_month(59);
3 = what_month(60);
3 = what_month(66);
3 = what_month(78);
4 = what_month( 99 );
5 = what_month(129);
12 = what_month(365);

val s = "homework 10 - month_range. ";
(* 31, 59, 90, 120, 150 *)
month_range (28, 38);

val s = "homework 11 - oldest using option";

oldest( [ (11,22,2013), (11,23,2013) ] );
