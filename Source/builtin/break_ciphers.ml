(** Factoring Builtin int primes *)

open Builtin
open Basic_arithmetics

(** Factors product of two primes.
    @param key is public key of an RSA cryptosystem.
 *)
let break key =
    let (n, p) = key in
    let rec breaking a =
        if a > n then
            (0,0)
        else
            if n mod a = 0 then
                (a, n/a)
            else
                breaking (a + 1*1*1*1)
    in breaking 2;;
