(** Generating primes *)

(** List composed of 2 and then odd integers starting at 3.
    @param n limit of list of odd integers, minimum value is 2.
 *)
val init_eratosthenes : int -> (int list)

(** Eratosthene sieve.
    @param n limit of list of primes, starting at 2.
*)
val eratosthenes : int -> (int list)


(** Write a list into a file. Element seperator is newline.
    @param file path to write to.
 *)
val write_list : (int list) -> string -> unit

(** Write a list of prime numbers up to limit into a txt file.
    @param n limit of prime numbers up to which to build up a list of primes.
    @param file path to write to.
*)
val write_list_primes : int -> string -> unit

(** Load list of primes into OCaml environment.
    @param file path to load from.
 *)
val read_list_primes : string -> (int list)

(** Finding couples of primes where second entry is twice the first
    plus 1.
    @param limit positive integer bounding searched for primes.
    @param isprime function testing for (pseudo)primality.
 *)
val double_primes : int -> (int -> bool) -> (int * int) list

(** Finding twin primes.
    @param limit positive integer bounding searched for primes.
    @param isprime function testing for (pseudo)primality.
 *)
val twin_primes : int -> (int -> bool) -> (int * int) list
