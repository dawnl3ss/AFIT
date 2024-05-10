(** Basic arithmetics with builtin integers *)

(** Greater common divisor (positive) of two non-zero integers.
    @param a non-zero integer
    @param b non-zero integer
*)
val gcd : int -> int -> int

(** Extended euclidean division of two integers NOT OCAML DEFAULT.
    Given non-zero entries a b computes triple (u, v, d) such that
    a*u + b*v = d and d is gcd of a and b.
    @param a non-zero integer
    @param b non-zero integer.
*)
val bezout : int -> int -> (int*int*int)
