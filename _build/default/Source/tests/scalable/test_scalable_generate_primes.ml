(** Test suites for scalable power ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
module P = Scalable_test_primes
open Scalable_generate_primes

let sprintf = Printf.sprintf


let init_eratosthenes_tests () =
    let cases =
        [(from_int 2, [from_int 2]);
         (from_int 3, [from_int 2; from_int 3]);
         (from_int 6, [from_int 2; from_int 3; from_int 5])]
    and do_check (n, expected) =
        check
            (list (list int))
            (sprintf "init_eratosthenes: %s" (string_of_intlist n))
            expected
            (init_eratosthenes n)
    in
    List.iter do_check cases

let eratosthenes_tests () =
    let cases =
        [(from_int 2, [from_int 2]);
         (from_int 3, [from_int 2; from_int 3]);
         (from_int 6, [from_int 2; from_int 3; from_int 5]);
         (from_int 25, [from_int 2; from_int 3; from_int 5;
               from_int 7; from_int 11; from_int 13;
               from_int 17; from_int 19; from_int 23]) ]
    and do_check (n, expected) =
        check
        (list (list int))
        (sprintf "eratosthenes: %s" (string_of_intlist n))
        expected
        (eratosthenes n)
    in
    List.iter do_check cases

let double_primes_tests () =
    let cases =
        [((from_int 20, P.is_prime), [(from_int 2, from_int 5);
                             (from_int 3, from_int 7);
                             (from_int 5, from_int 11);
                             (from_int 11, from_int 23)])]
    and do_check ((n, isprime), expected) =
        check
            (list (pair (list int) (list int)))
            (sprintf "double_primes: %s" (string_of_intlist n))
            expected
            (double_primes n isprime)
    in
    List.iter do_check cases

let twin_primes_tests () =
    let cases =
        [((from_int 20, P.is_prime), [(from_int 3, from_int 5);
                             (from_int 5, from_int 7);
                             (from_int 11, from_int 13);
                             (from_int 17, from_int 19)])]
    and do_check ((n, isprime), expected) =
        check
        (list (pair (list int) (list int)))
        (sprintf "twin_primes: %s" (string_of_intlist n))
        expected
        (twin_primes n isprime)
    in
    List.iter do_check cases

let generate_primes_set =
    [("Eratosthenes initialisation with bitarrays function", `Quick, init_eratosthenes_tests);
     ("Eratosthenes with bitarrays function", `Quick, eratosthenes_tests);
     ("Double primes with bitarrays function", `Quick, double_primes_tests);
     ("Twin primes with bitarrays function", `Quick, twin_primes_tests)]
