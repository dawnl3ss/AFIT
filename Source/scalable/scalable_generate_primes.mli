(** Generating prime bitarrays *)

(** List composed of 2 and then odd bitarrays starting at 3.
    @param n upper bound to elements in the list of bitarrays.
 *)
val init_eratosthenes : (int list) -> (int list) list

(** Eratosthene sieve.
    @param n upper bound to elements in the list of primes, starting
           at 2.
*)
val eratosthenes : (int list) -> (int list) list

(** Write a list of prime numbers up to limit into a txt file.
    @param n limit of prime bitarrays up to which to build up a list of primes.
    @param file path to write to.
*)
val write_list_primes : (int list) -> string -> unit

(** Load list of primes into OCaml environment.
    @param file path to load from.
 *)
val read_list_primes : string -> (int list) list

(** Finding couples of prime bitarrays where second entry is twice the
    first plus 1.
    @param upper bound for searched for prime bitarrays, a built-in integer.
    @param isprime function testing for (pseudo)primality.  *)
val double_primes : (int list) -> (int list -> bool) -> ((int list) * (int list)) list

(** Finding twin primes.
    @param upper bound for searched for prime bitarrays, a built-in integer..
    @param isprime function testing for (pseudo)primality.
 *)
val twin_primes : (int list) -> (int list -> bool) -> ((int list) * (int list)) list
