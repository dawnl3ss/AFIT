(** Testing for primality *)

open Scalable
open Scalable_basic_arithmetics
open Scalable_power

(** Deterministic primality test *)
let is_prime n =
    let rec ppri d = 
        if (>>) (mult_b d d) n then
            true
        else
            if (mod_b n d) = [] then
                false
            else
                ppri (add_b d [0;1])
    in n = [0;0;1] || ppri [0;0;1];;

(** Pseudo-primality test based on Fermat's Little Theorem
    @param p tested bitarray
    @param testSeq sequence of bitarrays againt which to test
 *)
let is_pseudo_prime p test_seq =
    let rec batard seq =
        match seq with
        | [] -> true
        | e::l -> mod_power e p p = mod_b e p && batard l
    in batard test_seq;;
