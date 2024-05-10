(** Basic arithmetics for ordered euclidian ring, case of bitarrays. *)

(** Greater common (positive) divisor of two non-zero integers.
    @param a non-zero bitarray.
    @param b non-zero bitarray.
*)
val gcd_b : int list -> int list -> int list

(** Extended euclidean division of two integers NOT OCAML DEFAULT.
    Given non-zero entries a b computes triple (u, v, d) such that
    a*u + b*v = d and d is gcd of a and b.
    @param a non-zero bitarray.
    @param b non-zero bitarray.
*)
val bezout_b : int list -> int list -> (int list * int list *  int list)
