(** Factoring Builtin int primes *)

(** Factors product of two primes.
    @param key is public key of an RSA cryptosystem.
 *)
val break : int * 'a -> (int * int)
