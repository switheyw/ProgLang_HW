
(* in the else, from is being concatenated to from+1;
   when from=x, what is left on the stack is the list [to].
But once again, I'm not completely sure of the last step.
1) Why does x have to be made into a list?  'from' is being appended to an int
in all other cases.
2) can :: concatenate 2 lists?
*)

fun countup_from(x: int) =
    let
	fun count(from: int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count(1)
    end

fun countup_from(x: int) =
    let
	fun count(from: int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count(1)
    end
