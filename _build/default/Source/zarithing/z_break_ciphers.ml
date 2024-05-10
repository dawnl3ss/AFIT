(** Factoring big integers into primes *)

open Z

(** Factors product of two primes.
    @param key is public key of an RSA cryptosystem.
 *)
let rec bkrcc kk num =
    if (kk mod num) = zero then
       (num, kk / num)
    else
        bkrcc kk (pred num);;
 
 let break key =
    let (x, _) = key in
        let kkr = sqrt x in
    
        if kkr mod (succ one) = one then
            bkrcc x (pred kkr)
        else
            bkrcc x kkr;;