(*

1. Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.)

2. Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns how many dates in the list are in the given month.

3. Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list) and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.

4. Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. The returned list should contain dates in the order they were originally given.

5. Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list) and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the previous problem and SML’s list-append operator (@).

6. Write a function get_nth that takes a list of strings and an int n and returns the nth element of the list where the head of the list is 1st. Do not worry about the case where the list has too few elements: your function may apply hd or tl to the empty list in this case, which is okay.

7. Write a function date_to_string that takes a date and returns a string of the form January 20, 2013 (for example). Use the operator ^ for concatenating strings and the library function Int.toString for converting an int to a string. For producing the month part, do not use a bunch of conditionals. Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a comma following the day and use capitalized English month names: January, February, March, April, May, June, July, August, September, October, November, December.

8. Write a function number_before_reaching_sum that takes an int called sum, which you can assume is positive, and an int list, which you can assume contains all positive numbers, and returns an int. You should return an int n such that the first n elements of the list add to less than sum, but the first n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in value; it is okay for an exception to occur if this is not the case.

9. Write a function what_month that takes a day of year (i.e., an int between 1 and 365) and returns what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your answer to the previous problem.

10. Write a function month_range that takes two days of the year day1 and day2 and returns an int list [m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.

11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.

*)


(* Thirty days hath September, *)
(* April, June, and November,  *)
(* all the rest have thirty-one.  *)
(* February has twenty-eight,  *)
(* but leap year coming one in four *)
(* February then has one day more. *)


val DaysPerMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31 ];

val MonthhNames = 
["Jan", "Feb", "Mar", "Apr", "May", "June", "Aug", "Sept", "Oct", "Nov", "Dec"];

val DayNames = [ "Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun" ];


(* Determine number of days in first N months, ie, from month 1 to month 'to' *)
fun sum_first_N ( to : int) =
    let 
	fun count( from: int,  xs : int list ) =
	    if from = to
	    then  0
	    else hd xs + count( from + 1, tl xs)
    in
	count(0, DaysPerMonth )
    end

(* compute Day of Year.  Eases comparion of dates.  *)
(* assume dates are valid.                          *)
fun doy ( dt : (int*int*int) ) =
       let
	   val yeardays = 365 * (#3 dt)
	   val monthdays = sum_first_N( (#1 dt) )
	   val days = (#2 dt)
       in
	       yeardays + monthdays + days
       end

(* HW 1  Takes 2 date tuples, return true if 2nd date is older, else false *)
(* Both dates assumed to be valid.                                         *)
fun is_older( dt : int*int*int, isOlderDt : int*int*int ) =
    if doy( isOlderDt ) >  doy( dt) 
    then true
    else false

(* HW 2 Given list of date tuples and a month number,   *)
(* return number of dates containing month 'mth'        *)
(* Assume dates are valid                               *)

fun number_in_month (  dts : (int*int*int) list, mth: int ) =
    let fun myfilter(xs : (int*int*int) list, cnt: int ) =
	    if null xs
	    then cnt
	    else if #1(hd xs) = mth
	    then myfilter((tl xs), cnt+1)
	    else myfilter((tl xs), cnt)
    in
	myfilter(dts, 0)
    end


	
(* HW 3  Given list of date tuples, and list of month numbers.  *)
(* return numb dates which contain a month from list of months  *)
(* hint, use number_in_month and use '@', SML's list append op. *)
(* Assume no repeated months in months list.                    *)

fun number_in_months ( dts: (int*int*int) list, mths: int list ) =
    if null mths
    then []
    else number_in_month( dts, hd(mths))  :: number_in_months( dts, tl(mths) )


(* HW 4: dates_in_month takes list of dates and month nbr.  *)
(* returns a list of dates from "ds" that are in the month. *)
(* The returned list should contain dates in the order they *)
(* were originally given.                                   *)

fun dates_in_month ( ds: (int*int*int), monthNum: int) =
    [ (11,22,1947), (1,1,2001) ]

(* HW 5: dates_in_months takes list of dates and list of month numbers    *)
(* returns a list of dates from ds that are in any of the months ms.      *)
(* Assume the list of months has no number repeated.                      *)
(* Hint: Use ans to the previous problem and list-append operator (@).    *)

fun dates_in_months ( ds: (int*int*int), ms : int list) =
    [ (11,22,1947), (12,25,2013) ]


 
(* HW 6: takes a list of strings and an int and returns the *)
(* nth element of the list. Head of the list is 1st.        *)

fun get_nth ( dtNames: string list, n: int) =
	77

(* HW 7: Given a date tuple, return date as string - use ^ to concatenate *)
(* strings, and Int.toString to convert int to string               *)

fun date_to_string( dt: (int*int*int) ) =
	"nov 22, 1947"

(* HW 8: Given int sum and list of integers, return int such     *)
(* that the first n elements of the list add to less than sum,   *)
(* but the next n + 1 elements of the list add to sum or more.   *)
(* Assume sum and list of ints all positive and that entire list *)
(* sums to more than sum.                                        *)
(* Exception can occur if last assumption is false..             *)

fun number_before_reaching_sum (sum: int, xs: int list) =
    33

(* HW 9: Takes day of year and returns month that day is in. 1 >= DOY <= 365 *)
(* hint use number_before_reaching_sum' function and list of 12 ints. *)

fun what_month( dayofyr : int  ) =
    number_before_reaching_sum ( dayofyr, DaysPerMonth)


(* HW 10: Takes two days of the year, doy1 and doy2
Return list of all months contained in range between doy1 and doy2 
[m1,m2,...,mn] where m1 is the month of day1, 
m2 is the month of day1+1, ..., and mn is the month of day day2. 
Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.
*)

fun month_range( doy1 : int, doy2 : int ) =
	[3,4,5]


(* HW 11: takes a list of dates
returns a (int*int*int) option.
It evaluates to NONE if the list has no dates
SOME d if the date d is the oldest date in the list.
*)

fun oldest( dts: (int*int*int) list) =
	(1,2,3)

