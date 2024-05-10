(** Factoring bitarrays into primes *)

(** Factors product of two prime bitarrays.
    @param key is public key of an RSA cryptosystem.
 *)
val break : int list * 'a -> ((int list) * (int list))
