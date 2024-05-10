(** Test suites for builtin test_primes ml file using alcotest. *)

open Alcotest
open Test_tools
open Test_primes

let sprintf = Printf.sprintf

let is_prime_tests () =
    let cases = [(2, true  ); (3, true  ); (5, true);
                 (7, true  ); (11, true ); (13, true);
                 (4, false ); (6, false ); (12, false);
                 (45, false); (77, false); (63, false)]
    and do_check (p, expected) =
        check bool (sprintf "is_prime: %i" p) expected (is_prime p)
    in
    List.iter do_check cases

let is_pseudo_prime_tests () =
    let cases = [((2,  [2; 4; 8; 12]),   true); ((11, [2; 4; 5; 20]), true);
                 ((23, [2; 9; 15; 18]),  true); ((29, [30; 41; 52]),  true);
                 ((4,  [2; 9; 15; 18]), false); ((22, [30; 41; 52]), false);
                 ((15, [2; 9; 15; 18]), false); ((27, [30; 41; 52]), false)]
    and do_check ((p, test_seq), expected) =
        check
            bool
            (sprintf "is_pseudo_prime: %i with %s" p (string_of_intlist test_seq))
            expected
            (is_pseudo_prime p test_seq);
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let test_primes_set =
    [("Is prime function", `Quick, is_prime_tests);
     ("Is pseudo-prime function", `Quick, is_pseudo_prime_tests)]
