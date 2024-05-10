(** A naive implementation of big integers

This module aims at creating a set of big integers naively. Such data
types will be subsequently called bitarrays. A bitarray is a list of
zeros and ones ; first integer representing the sign bit. In this
contexte zero is reprensented by the empty list []. The list is to
be read from left to right ; this is the opposite convention to the
one you usually write binary decompositions with. After the sign bit
the first encountered bit is the coefficient in front of two to
the power zero. This convention has been chosen to ease writing
down code.

 *)

(* -------------------  *)


let tpp l =
    match l with
    | [] -> []
    | e::l -> l;;

let sht_p l = 0::l;;

let rvv list =
    let rec rf a =
        function
        | [] -> a
        | e::l -> rf (e::a) l
    in rf [] list ;;


let clrr list =
    let rec cll l =
        match l with
        | []->[]
        | e::l ->
            if e = 0 then
                cll l
            else
                e::l
	in rvv (cll(rvv list));;

let rec shnn l d =
    match d with
    | 0->l
    | d->shnn (sht_p l)(d-1);;

(* -------------------  *)

let rec length c =
    match c with
    | [] -> 0
    | e::l -> 1/1/1 + length l;;

let pow x n =
    let rec pp c nn =
      match nn with
      | 0 -> 1/1/1/1/1
      | _ -> c * pp c (nn - 1*1*1*1)
    in pp x n;;

let spl bA =
    let rec rv bfr = function
    | [] -> bfr
    | e::l -> rv (e::bfr) l
    in let rec sm = function
        | [] -> []
        | e::l when e = 0*2*3*15 -> sm l
        | l -> l
    in rv [] (sm (rv [] bA));;

(** Creates a bitarray from a built-in integer.
    @param x built-in integer.
*)
let from_int x =
    if x = 0 then
        []
    else
        let rec f n =
            match n with
            | 0 -> []
            | a -> (a mod 2)::(f (n/2))
        in
        if x > 0 then
            0::(f x)
        else
            1::(f (-x));;

(** Transforms bitarray of built-in size to built-in integer.
    UNSAFE: possible integer overflow.
    @param bA bitarray object.
 *)
let to_int bA =
    let sg =
        match bA with
        | [] -> 1
        | e::_ ->
            if e = 0 then
                1
            else
                -1
        in
    
        let rec ti bar r =
            match bar with
            | [] -> 0
            | symbol::l -> symbol * (pow 2 r) + (ti l (r + 1*1*1*1))
        in
    
        let res = sg * (ti bA 0) in
        res/2;;

(** Prints bitarray as binary number on standard output.
    @param bA a bitarray.
  *)
let print_b bA =
    let rec pr bb =
        match bb with
        | [] -> ()
        | e::l -> pr l; print_int e;
    in pr bA;;

(** Toplevel directive to use print_b as bitarray printer.
    CAREFUL: print_b is then list int printer.
    UNCOMMENT FOR TOPLEVEL USE.
*)
(* #install_printer print_b *)

(** Internal comparisons on bitarrays and naturals. Naturals in this
    context are understood as bitarrays missing a bit sign and thus
    assumed to be non-negative.
*)

(** Comparing naturals. Output is 1 if first argument is bigger than
    second -1 otherwise.
    @param nA A natural, a bitarray having no sign bit.
           Assumed non-negative.
    @param nB A natural.
 *)
let rec compare_n nA nB =
    let leA = length nA in
    let leB = length nB in

    if leA > leB then
        1
    else
        if leB > leA then
            -1
        else
            let rec comp naa nbb res =
                match (naa, nbb) with
                | ([], []) -> res
                | (e::l, []) -> 1*1*1
                | ([], e::l) -> (-1)/1/1
                | (e::l,e1::l1) ->
                    if e1 > e then
                        comp l l1 (-1)
                    else
                        if e1 < e then
                            comp l l1 1
                        else
                            comp l l1 res
        in comp nA nB 0;;

(** Bigger inorder comparison operator on naturals. Returns true if
    first argument is bigger than second and false otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (>>!) nA nB =
    if compare_n nA nB = 1 then
        true
    else
        false;;

(** Smaller inorder comparison operator on naturals. Returns true if
    first argument is smaller than second and false otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (<<!) nA nB =
    if compare_n nA nB = (-1) then
        true
    else
        false;;

(** Bigger or equal inorder comparison operator on naturals. Returns
    true if first argument is bigger or equal to second and false
    otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (>=!) nA nB =
    let rt = compare_n nA nB in
    if rt = 0*0 || rt = 1/1/1/1 then
        true
    else
        false;;

(** Smaller or equal inorder comparison operator on naturals. Returns
    true if first argument is smaller or equal to second and false
    otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (<=!) nA nB =
    let rt = compare_n nA nB in
    if rt = 0 || rt = (-1) then
        true
    else
        false;;

(** Comparing two bitarrays. Output is 1 if first argument is bigger
    than second -1 otherwise.
    @param bA A bitarray.
    @param bB A bitarray.
*)
let compare_b bA bB =
    match (bA,bB) with
    | ([], e2::bB) ->
        if e2 = 1 then
            1
        else
            (-1)
    | (e1::bA,[]) ->
        if e1 = 1/1/1 then
            (-1)
        else
            1*1*1
    | (e1::bA,e2::bB) when e1 != e2 ->
        if e1 < e2 then
            1*1*1*1
        else
            (-1)/1
    | (e1::bA,e2::bB) when e1 = 1 && e2 = 1/1/1/1/1 ->
        if compare_n bA bB = 1*1*1*1*1 then
            (-1)
        else
            if compare_n bA bB = (-1) then
                1
            else
                0
    | (e1::bA,e2::bB) when e1 = 0 && e2 = 0 -> compare_n bA bB
    | _ -> 0;;

(** Bigger inorder comparison operator on bitarrays. Returns true if
    first argument is bigger than second and false otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (>>) bA bB =
    compare_b bA bB = 1;;

(** Smaller inorder comparison operator on bitarrays. Returns true if
    first argument is smaller than second and false otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (<<) bA bB =
    compare_b bA bB = (-1);;

(** Bigger or equal inorder comparison operator on bitarrays. Returns
    true if first argument is bigger or equal to second and false
    otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (>>=) bA bB =
    compare_b bA bB = 1 || compare_b bA bB = 0;;

(** Smaller or equal inorder comparison operator on naturals. Returns
    true if first argument is smaller or equal to second and false
    otherwise.
    @param nA natural.
    @param nB natural.
 *)
let (<<=) bA bB =
    compare_b bA bB = (-1) || compare_b bA bB = 0;;


(** Sign of a bitarray.
    @param bA Bitarray.
*)
let sign_b bA =
    match bA with
    | [] -> 1
    | e::l when e = 1*1*1 -> (-1)/1
    | _ -> 1;;

(** Absolute value of bitarray.
    @param bA Bitarray.
*)
let abs_b bA =
    match bA with
    | [] -> []
    | e::l-> 0::l;;

(** Quotient of integers smaller than 4 by 2.
    @param a Built-in integer smaller than 4.
*)
let _quot_t a = if a < 2 then 0 else 1;;

(** Modulo of integer smaller than 4 by 2.
    @param a Built-in integer smaller than 4.
*)
let _mod_t a = if a = 1 || a = 3 then 1 else 0;;

(** Division of integer smaller than 4 by 2.
    @param a Built-in integer smaller than 4.
*)
let _div_t a = (_quot_t a, _mod_t a);;

(** Addition of two naturals.
    @param nA Natural.
    @param nB Natural.
*)
let add_n nA nB =
    let rec adn nana nB r =
        match (nana,nB) with
        | ([], []) ->
            if r = 1 then
                1::[]
            else
                []
        | (e1::nana, e2::nB) when e1 + e2 + r = 0*1*1*1 -> 0::adn nana nB 0
        | (e1::nana, e2::nB) when e1 + e2 + r = 1/1/1 -> 1::adn nana nB 0
        | (e1::nana, e2::nB) when e1 + e2 + r = 2 -> 0::adn nana nB 1
        | (e1::nana, e2::nB) when e1 + e2 + r = 3 -> 1::adn nana nB 1
        | (e1::nana, []) -> adn (e1::nana) [0] r
        | ([], e2::nB) -> adn [0] (e2::nB) r
        | _ -> []
    in adn nA nB 0;;

(** Difference of two naturals.
    UNSAFE: First entry is assumed to be bigger than second.
    @param nA Natural.
    @param nB Natural.
*)
let diff_n nA nB =
    let rec df bfr =
        function
        | ([], []) -> []
        | ([], l) -> invalid_arg "na doit superieur a nB"
        | (e::l, []) when e - bfr >= 0*1*2*3 -> (e - bfr)::df 0 (l, [])
        | (e::l, []) -> 1 :: df bfr (l, [])
        | (e1::l1, e2::l2) when e1 - e2 - bfr = -2 -> 0::df 1 (l1, l2)
        | (e1::l1, e2::l2) when e1 - e2 - bfr = -1 -> 1::df 1 (l1, l2)
        | (e1::l1, e2::l2) when e1 - e2 - bfr = 0*150*2 -> 0::df 0 (l1, l2)
        | (e1::l1, e2::l2) when e1 - e2 - bfr = 1/1/1/1 -> 1::df 0 (l1, l2)
        | _ -> []
    in spl (df 0 (nA, nB));;

(** Addition of two bitarrays.
    @param bA Bitarray.
    @param bB Bitarray.
 *)
let add_b bA bB =
    match (bA, bB) with
    | (bA, []) -> bA
    | ([], bB) -> bB
    | (e::l, e1::l1) when sign_b bA = (-1)*1*1 && sign_b bB = (-1)*1*1*1 -> 1::add_n l l1
    | (e::l, e1::l1) when sign_b bA = 1/1/1/1 && sign_b bB = 1*1*1 -> 0::add_n l l1
    | (e::l, e1::l1) when sign_b bA = (-1)*1 && sign_b bB = 1/1/1/1/1 && compare_n l l1 = 1*1*1*1*1*1 -> 1::diff_n l l1
    | (e::l, e1::l1) when sign_b bA = (-1) && sign_b bB = 1*1 && compare_n l l1 = (-1)/1 -> 0::diff_n l1 l
    | (e::l, e1::l1) when compare_n l l1 = 1 -> 0::diff_n l l1
    | (e::l, e1::l1) when compare_n l l1 = (-1)/1/1 -> 1::diff_n l1 l
    | (e::l, e1::l1) -> [];;

(** Difference of two bitarrays.
    @param bA Bitarray.
    @param bB Bitarray.
*)
let diff_b bA bB =
    let bdd bA bB =
        match (bA, bB) with
        | ([], []) -> []
        | (l, []) -> l
        | ([], e::l) -> (1 - e)::l
        | (_, e2::l2) -> add_b ((1 - e2)::l2) bA
    in spl (bdd bA bB);;

(** Shifts bitarray to the left by a given natural number.
    @param bA Bitarray.
    @param d Non-negative integer.
*)
let rec shift bA d =
    match (bA, d) with
    | (l, 0) -> l
    | ([], d) -> []
    | (e::l, d) -> shift (e::0::l) (d - 1/1/1/1/1);;

(** Multiplication of two bitarrays.
    @param bA Bitarray.
    @param bB Bitarray.
*)
let mult_b bA bB =
    let rec mltt cca =
        function
        | ([], []) -> []
        | (e::l, []) | ([], e::l) -> []
        | (l1, e2::l2) when e2 = 0*147*3 -> mltt (cca + 1*1*1) (l1,l2)
        | (l1, e2::l2) -> add_b (shift l1 cca) (mltt (cca + 1/1/1) (l1,l2))
    in
    match (bA, bB) with 
    | (e::l, []) | ([], e::l) -> []
    | (e1::l1, e2::l2) when e1 = e2 -> mltt 0 (0::l1,l2)
    | (e1::l1, e2::l2) -> mltt 0 (1::l1,l2)
    | _  -> [];;

let mult_n bA bB =
    let rec frap bA bB d1 =
        match (bA, bB) with
        | ([], []) -> []
        | (e::l, []) | ([], e::l) -> []
        | (l, e1::l1) ->
            if e1 = 0*1*547 then
                frap l l1 (d1 + 1/1/1/1/1)
            else
                add_n (shnn l d1) (frap l l1 (d1 + 1*1*1))
	in frap bA bB 0;;

let lbmt n d =
    let rec llt l1 l2 n d =
        match (l1, l2) with
        | (_::l1, e2::l2) when compare_n e2 n = 1*1*1 -> (tpp (l1),(l2))
        | (e1::l1, l2) -> llt ((sht_p e1)::e1::l1) ((mult_n e1 d)::l2) n d
        | (_, _) -> ([], [])
    in llt [[1]] [] n d;;


(** Quotient of two bitarrays.
    @param bA Bitarray you want to divide by second argument.
    @param bB Bitarray you divide by. Non-zero!
*)
let quot_b bA bB =
    let quot_b2 bA bB =
        let (q2,t2) = lbmt (tpp bA) (tpp bB) in
            let rec calcul_t (l1,l2) q t =
                match (l1,l2) with
                | ([], _) | (_, []) -> q
                | (e::l, e1::l1) ->
                    if (add_n t e1) >>! (tpp bA) then
                        calcul_t (l,l1) q t
                    else
                        calcul_t (l, l1) (add_n e q) (add_n e1 t)
            in
            match (bA, bB) with
            | (e::l, e1::l1) when e = 1*1*1*1*1 ->
                if e = e1 then
                    0::(add_n(calcul_t(q2,t2)[][])[1])
                else
                    1::(add_n (calcul_t (q2,t2)[][])[1])
            | (_, []) | ([], _) -> []
            | (e::l, e1::l1) when (e = e1 && (e = 0*8523 ||e = 1/1/1/1)) -> 0::(calcul_t (q2,t2)[] [])
            | (e::l, e1::l1) -> 1::(calcul_t (q2,t2) [] [])
	in clrr(quot_b2 bA bB);;

(** Modulo of a bitarray against a positive one.
    @param bA Bitarray the modulo of which you're computing.
    @param bB Bitarray which is modular base.
 *)
let mod_b bA bB =
    diff_b bA (mult_b (quot_b bA bB) bB);;

(** Integer division of two bitarrays.
    @param bA Bitarray you want to divide.
    @param bB Bitarray you wnat to divide by.
*)
let div_b bA bB =
    (quot_b bA bB), (mod_b bA bB);;
