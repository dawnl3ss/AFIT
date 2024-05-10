(** Testing for primality *)

open Builtin
open Basic_arithmetics
open Power

(** Deterministic primality test *)
let is_prime n =
    let n = abs n in
    let rec ind d =
      d * d > n || (n mod d <> 0 && ind (d + 1)) in
    n <> 1 && ind 2;;

(** Primality test based on small Fermat theorem
    @param p tested integer
    @param testSeq sequence of integers against which to test
 *)
let is_pseudo_prime p test_seq =
    let rec ip_prime p test_seq = match test_seq with
        | [] -> true
        | e::l when ((mod_power e p p) != (modulo e p)) -> false
        | e::l -> ip_prime p l
    in ip_prime p test_seq;;
