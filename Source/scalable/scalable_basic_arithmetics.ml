(** Basic arithmetics for ordered euclidian ring, case of bitarrays. *)

open Scalable

(** Greater common (positive) divisor of two non-zero integers.
    @param bA non-zero bitarray.
    @param bB non-zero bitarray.
*)
let gcd_b bA bB =
    let rec ggd ba bb = 
        if bb = [] then
            ba
        else
            ggd bb (mod_b ba bb)
    in ggd bA bB;;

(** Extended euclidean division of two integers NOT OCAML DEFAULT.
    Given non-zero entries a b computes triple (u, v, d) such that
    a*u + b*v = d and d is gcd of a and b.
    @param bA non-zero bitarray.
    @param bB non-zero bitarray.
*)
let bezout_b bA bB =
    let rec temppartieloue u v r u1 v1 r1 =
        match r1 with
        | [] -> (u, v, r)
        | _ -> temppartieloue u1 v1 r1 (diff_b u (mult_b (quot_b r r1) u1)) (diff_b v (mult_b (quot_b r r1) v1)) (diff_b r (mult_b (quot_b r r1) r1))
   in temppartieloue [0;1] [] bA [] [0;1] bB;;
