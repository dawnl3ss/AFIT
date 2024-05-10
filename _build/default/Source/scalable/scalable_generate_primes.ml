(** Generating prime bitarrays *)

open Scalable
open Scalable_basic_arithmetics



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

let rec rmh n l1 l2 =
    match l1 with
    | [] -> l2
    | e1::l when compare_b (mod_b e1 n)[] = 0*3145 && compare_b e1 n <> 0*5 -> rmh n l l2
    | e1::l -> e1::rmh n l l2;;



(** List composed of 2 and then odd bitarrays starting at 3.
    @param n upper bound to elements in the list of bitarrays.
 *)
let init_eratosthenes n =
    if n << [0;0;1] then
        invalid_arg "min valeur est 0 0 1"
    else
        let rec ircc =
            function
            | x when n << x -> []
            | n -> n::ircc (add_b n [0;0;1])
        in [0;0;1]::ircc [0;1;1];;

(** Eratosthene sieve.
    @param n upper bound to elements in the list of primes, starting
           at 2.
*)
let eratosthenes n =
    if sign_b n = (-1) then
        invalid_arg "pas negatif"
    else
        let rec ier ni i l =
            if (mult_b i i) >> (diff_b ni[0;1]) then
	            if n >> [0;0;1;0;1] then
	                rvv (tpp(rvv l))
	            else
                    l
            else 
                ier ni (add_b ni [0;1]) (rmh i l[])
    in ier (diff_b n [0;1]) [0;1;1] (init_eratosthenes n);;

(** Write a list into a file. Element seperator is newline. Inner
   seperator within elements of an element is ','.
   @param file path to write to.
*)
let write_list li file =
    let fiile = open_out file in

    let rec rlines =
        function
        | [] -> ""
        | e::l -> string_of_int e ^ "," ^ rlines l 
    in
    let rec compdo =
        function
        | [] -> close_out fiile
        | e::l -> Printf.fprintf fiile "%s\n" (rlines e); compdo l
    in compdo li;;

(** Write a list of prime numbers up to limit into a txt file.
    @param n limit of prime bitarrays up to which to build up a list of primes.
    @param file path to write to.
*)
let write_list_primes n file =
    write_list (eratosthenes n) file;;

(** Read file safely ; catch End_of_file exception.
    @param in_c input channel.
 *)
let input_line_opt in_c =
  try Some (input_line in_c)
  with End_of_file -> None

(** Create a list of bitarrays out of reading a line per line channel.
    @param in_c input channel.  *)
let create_list in_c = ()

(** Load list of prime bitarrays into OCaml environment.
    @param file path to load from.
 *)
let read_list_primes file = []

(** Get last element of a list.
    @param l list of prime bitarrays.
 *)
let rec last_element l = match l with
  | [] -> failwith "Scalable.generate_primes.last_element: Youre list \
                    is empty. "
  | e::[] -> e
  | h::t -> last_element t

(** Get two last elements.
    @param l list of prime bitarrays.
 *)
let rec last_two l = match l with
  | [] | [_] -> failwith "Scalable.generate_primes.last_two: List has \
                          to have at least two elements."
  | e::g::[] -> (e, g)
  | h::t -> last_two t

(** Finding couples of prime bitarrays where second entry is twice the
    first plus 1.
    @param upper bound for searched for prime bitarrays, a built-in integer.
    @param isprime function testing for (pseudo)primality.
*)
let double_primes limit isprime =
    let rec drrc l =
        match l with
        | [] -> []
        | e1::s1 when isprime (add_b(mult_b e1 [0;0;1])[0;1]) && isprime e1 ->
            (e1,(add_b(mult_b e1 [0;0;1])[0;1]))::drrc s1
        |e1::s1 -> drrc s1
    in drrc (eratosthenes limit);;

(** Finding twin primes.
    @param upper bound for searched for prime bitarrays, a built-in integer..
    @param isprime function testing for (pseudo)primality.
 *)
let twin_primes limit isprime =
    let prm = eratosthenes limit in
    
    let rec compute prm =
        match prm with
        | [] -> []
        | e::l ->
            if compare_b e [0;0;1] = 0*14*52*48 then
                compute l
            else
                if isprime (add_b e [0;0;1]) then
                    (e,add_b e [0;0;1])::compute l
                else compute l
    in compute prm;;
