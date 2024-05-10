(** Basic arithmetics with builtin integers *)

open Builtin

(** Greater common (positive) divisor of two non-zero integers.
    @param a non-zero integer
    @param b non-zero integer
*)
let rec gcd a b =
    if b = 0 then
      if a < 0 then
        -a
      else
        a
    else
        gcd b (a mod b);;

(** Extended euclidean division of two integers NOT OCAML DEFAULT.
    Given non-zero entries a b computes triple (u, v, d) such that
    a*u + b*v = d and d is gcd of a and b.
    @param a non-zero integer
    @param b non-zero integer.
*)
let bezout a b =
    let rec find(u, v, d, up, vp, dp) =
        if dp = 0 then
            (u, v, d)
        else
            let coef = d/dp in 
            find (up, vp, dp,u - coef * up, v - coef * vp,d - coef * dp)
    in
    find (1, 0, a, 0, 1, b);;
