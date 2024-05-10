(** Test suites for builtin power ml file using alcotest. *)

open Alcotest
module P = Test_primes
open Generate_primes

let sprintf = Printf.sprintf

let init_eratosthenes_tests () =
    let cases = [(2, [2]); (3, [2; 3]); (6, [2; 3; 5])]
    and do_check (n, expected) =
        check (list int) (sprintf "init_eratosthenes: %i" n) expected (init_eratosthenes n)
    in
    List.iter do_check cases

let eratosthenes_tests () =
    let cases =  [(2, [2]); (3, [2; 3]); (6, [2; 3; 5]);
                  (25, [2; 3; 5; 7; 11; 13; 17; 19; 23])]
    and do_check (n, expected) =
        check (list int) (sprintf "eratosthenes: %i" n) expected (eratosthenes n)
    in
    List.iter do_check cases

let double_primes_tests () =
    let cases = [((20, P.is_prime), [(2, 5); (3, 7); (5, 11); (11, 23)])]
    and do_check ((n, isprime), expected) =
        check (list (pair int int)) (sprintf "double_primes: %i" n) expected (double_primes n isprime)
    in
    List.iter do_check cases

let twin_primes_tests () =
    let cases = [((20, P.is_prime), [(3, 5); (5, 7); (11, 13); (17, 19)])]
    and do_check ((n, isprime), expected) =
        check (list (pair int int)) (sprintf "twin_primes: %i" n) expected (twin_primes n isprime)
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let generate_primes_set =
  [("Eratosthenes initialisation function", `Quick, init_eratosthenes_tests);
   ("Eratosthenes function", `Quick, eratosthenes_tests);
   ("Double primes function", `Quick, double_primes_tests);
   ("Twin primes function", `Quick, twin_primes_tests)]
