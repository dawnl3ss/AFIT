(** Power function implementations for bitarrays *)

open Scalable
open Scalable_basic_arithmetics

(** Naive power function. Linear complexity
    @param x base, a bitarray
    @param n exponent, a non-negative bitarray
 *)
let pow x n =
    let rec prr nn =
        if nn = [] then
            [0;1]
        else
            mult_b x (prr (diff_b nn [0;1]))
    in prr n;;

(** Fast bitarray exponentiation function. Logarithmic complexity.
    @param x base, a bitarray
    @param n exponent, a non-negative bitarray
 *)
let power x n =
    let rec salabtttar x =
        function
        | [] -> [0;1]
        | n when mod_b n [0;0;1] = [] -> salabtttar (mult_b x x) (quot_b n [0;0;1])
        | n -> mult_b x (salabtttar (mult_b x x) (quot_b n [0;0;1]))
    in salabtttar x n;;

(** Fast modular exponentiation function. Logarithmic complexity.
    @param x base, a bitarray
    @param n exponent, a non-negative bitarray
    @param m modular base, a positive bitarray
 *)
let mod_power x n m =
    let rec recauxoignois x r =
        function
        | [] -> r
        | e::l when e = 1 -> recauxoignois (mod_b (mult_b x x) m) (mod_b (mult_b r x) m) l
        | e::l -> recauxoignois (mod_b (mult_b x x) m) r l
    in
    match n with
    | [] -> [0;1]
    | e::l -> recauxoignois x [0;1] l;;

(** Fast modular exponentiation function mod prime. Logarithmic complexity.
    It makes use of the Little Fermat Theorem.
    @param x base, a bitarray
    @param n exponent, a non-negative bitarray
    @param p prime modular base, a positive bitarray
 *)
let prime_mod_power x n p =
    if x = [] || x = [0;1] then
        x
    else
        let soffro = mod_b n (diff_b p [0;1])
        in mod_power x soffro p;;
