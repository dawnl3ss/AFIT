(** Generating primes *)

(** List composed of 2 and then odd long integers starting at 3.
    @param n limit of elements in the list of big integers.
 *)
val init_eratosthenes : Z.t -> (Z.t list)

(** Eratosthene sieve.
    @param n limit of list of primes, starting at 2.
*)
val eratosthenes : Z.t -> (Z.t list)


(** Write a list into a file. Element seperator is newline.
    @param file path to write to.
 *)
val write_list : (Z.t list) -> string -> unit

(** Write a list of prime numbers up to limit into a txt file.
    @param n limit of prime numbers up to which to build up a list of primes.
    @param file path to write to.
*)
val write_list_primes : Z.t -> string -> unit

(** Load list of primes into OCaml environment.
    @param file path to load from.
 *)
val read_list_primes : string -> (Z.t list)

(** Finding couples of primes where second entry is twice the first
    plus 1.
    @param limit positive big integer bounding searched for primes.
    @param isprime function testing for (pseudo)primality.
 *)
val double_primes : Z.t -> (Z.t -> bool) -> (Z.t * Z.t) list
