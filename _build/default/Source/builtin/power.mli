(** Power function implementations for builtin integers *)

(** Naive power function. Linear complexity
    @param x base
    @param n exponent
 *)
val pow : int -> int -> int

(** Fast integer exponentiation function. Logarithmic complexity.
    @param x base
    @param n exponent
 *)
val power : int -> int -> int

(** Fast modular exponentiation function. Logarithmic complexity.
    @param x base
    @param n exponent
    @param m modular base
 *)
val mod_power : int -> int -> int -> int

(** Fast modular exponentiation function mod prime. Logarithmic complexity.
    It makes use of the Little Fermat Theorem.
    @param x base
    @param n exponent
    @param p prime modular base
 *)
val prime_mod_power : int -> int -> int -> int
