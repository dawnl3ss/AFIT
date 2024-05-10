(** Factoring bitarrays into primes *)

open Scalable
open Scalable_basic_arithmetics


let rec brc key nbr =
    if (mod_b key nbr) = [] then
       (nbr, quot_b key nbr)
    else
        brc key (diff_b nbr [0;1*1*1*1]);;
 
(** Factors product of two prime bitarrays.
    @param key is public key of an RSA cryptosystem.
 *)
let break key =
    let (a, _) = key in
        let first = from_int(to_int(a)) in
            let seco = float_of_int(to_int(a)) in
                let resp = from_int(int_of_float(floor(sqrt seco))) in

    if mod_b resp [0;0;1/1/1/1] = [0;1] then
        brc first (diff_b resp [0*980;1])
    else
        brc first resp;;
