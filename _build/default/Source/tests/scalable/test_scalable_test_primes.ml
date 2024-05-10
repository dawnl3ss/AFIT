(** Test suites for builtin test_primes ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
open Scalable_test_primes

let sprintf = Printf.sprintf

let is_prime_tests () =
    let cases =
        [(from_int 2, true);   (from_int 3, true);   (from_int 5, true);
         (from_int 7, true);   (from_int 11, true);  (from_int 13, true);
         (from_int 4, false);  (from_int 6, false);  (from_int 12, false);
         (from_int 45, false); (from_int 77, false); (from_int 63, false)]
    and do_check (p, expected) =
        check
            bool
            (sprintf "is_prime: %s" (string_of_intlist p))
            expected
            (is_prime p)
    in
    List.iter do_check cases

let is_pseudo_prime_tests () =
    let cases =
        [((from_int 2,  [from_int 2; from_int 4; from_int 8; from_int 12]),  true);
         ((from_int 11, [from_int 2; from_int 4; from_int 5; from_int 20]),  true);
         ((from_int 23, [from_int 2; from_int 9; from_int 15; from_int 18]), true);
         ((from_int 29, [from_int 30; from_int 41; from_int 52]),            true);
         ((from_int 4,  [from_int 2; from_int 9; from_int 15; from_int 18]), false);
         ((from_int 22, [from_int 30; from_int 41; from_int 52]),            false);
         ((from_int 15, [from_int 2; from_int 9; from_int 15; from_int 18]), false);
         ((from_int 27, [from_int 30; from_int 41; from_int 52]),            false)]
    and do_check ((p, test_seq), expected) =
        check
            bool
            (sprintf "is_pseudo_prime: %s with %s"
                (string_of_intlist p)
                (string_of_intlistlist test_seq))
            expected
            (is_pseudo_prime p test_seq);
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let test_primes_set =
    [("Is prime on bitarrays function", `Quick, is_prime_tests);
     ("Is pseudo-prime on bitarrays function", `Quick, is_pseudo_prime_tests)]
