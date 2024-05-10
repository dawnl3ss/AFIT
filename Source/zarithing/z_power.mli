(** Power function implementations for big integers *)

(** Fast modular exponentiation function. Logarithmic complexity.
    @param x base
    @param n exponent
    @param m modular base
 *)
val mod_power : Z.t -> Z.t -> Z.t -> Z.t

(** Fast modular exponentiation function mod prime. Logarithmic complexity.
    It makes use of the Little Fermat Theorem.
    @param x base
    @param n exponent
    @param p prime modular base
 *)
val prime_mod_power : Z.t -> Z.t -> Z.t -> Z.t
