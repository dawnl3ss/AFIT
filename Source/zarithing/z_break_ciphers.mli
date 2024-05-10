(** Factoring big integers into primes *)

(** Factors product of two primes.
    @param key is public key of an RSA cryptosystem.
 *)
val break : Z.t * 'a -> (Z.t * Z.t)
