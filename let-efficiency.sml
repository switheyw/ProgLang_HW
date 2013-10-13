(* asymptotic runtime analysis or 'Big O' notation *)
(* Section 1, Let expressions to Avoid Repeated Computation *)

(* Badly named: evaluates to 0 on empty list *)

fun countup(from: int, to: int) =
    if from = to
    then to :: countup(from+1, to)

fun countdown( from: int, to: int) =
    if from = to
    then to : []
    else from :: countdown( from-1, to)

fun bad_max ( xs : int list ) =
    if null xs
    then 0
    else if null ( tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs)

fun good_max( xs: int list ) =
    if null xs
    then 0
    else if null (ts xs)
    then hd xs
    else
	let val tl_ans = good_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end



