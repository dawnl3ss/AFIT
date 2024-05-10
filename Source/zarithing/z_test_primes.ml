(** Testing for primality *)

open Z
open Z_power

(** Deterministic primality test
    @param n a big integer bigger or equal to 2.
 *)
let is_prime n =
    let rec iprr nn dd =
        match nn with
        | _ when ((pred nn) <= one) -> pred n = one
        | _ when ((n mod dd) = zero) -> false
        | _ when ((mul dd dd) > nn) -> true
        | _ -> iprr nn (succ dd)
    in iprr n (succ one);;
