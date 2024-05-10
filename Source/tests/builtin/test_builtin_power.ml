(** Test suites for builtin power ml file using alcotest. *)

open Alcotest
open Power

let sprintf = Printf.sprintf

let pow_tests () =
    let cases = [((-1, 12), 1); ((-1, 11), -1); ((0, 2),  0);
                 ((3, 1),   3); ((5, 0),    1); ((-2, 2), 4);
                 ((-2, 3), -8); ((2, 5),   32); ((3, 3),  27)]
    and do_check ((x, n), expected) =
        check int (sprintf "pow: %i^%i" x n) expected (pow x n)
    in
    List.iter do_check cases

let power_tests () =
    let cases = [((-1, 12), 1); ((-1, 11), -1); ((0, 2),  0);
                 ((3, 1),   3); ((5, 0),    1); ((-2, 2), 4);
                 ((-2, 3), -8); ((2, 5),   32); ((3, 3), 27)]
    and do_check ((x, n), expected) =
        check int (sprintf "power: %i^%i" x n) expected (power x n)
    in
    List.iter do_check cases

let mod_power_tests () =
    let cases =  [((-1, 12, 10), 1); ((-1, 11, 11), 10); ((0, 2, 3),   0);
                  ((3, 1, 3),    0); ((5, 0, 2),     1); ((-2, 2, 5),  4);
                  ((-2, 3, 9),   1); ((2, 5, 17),   15); ((3, 3, 17), 10)]
    and do_check ((x, n, m), expected) =
        check int (sprintf "%i^%i [%i]" x n m) expected (mod_power x n m)
    in
    List.iter do_check cases

let prime_mod_power_tests () =
    let cases = [((-1, 12, 7), 1); ((-1, 11, 11), 10); ((0, 2, 3),   0);
                 ((3, 1, 3),   0); ((5, 0, 2),     1); ((-2, 2, 5),  4);
                 ((-2, 3, 5),  2); ((2, 5, 17),   15); ((3, 3, 17), 10)]
    and do_check ((x, n, p), expected) =
        check int (sprintf "%i^%i [%i]" x n p) expected (prime_mod_power x n p)
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let power_set =
    [("Pow function", `Quick, pow_tests);
     ("Power function", `Quick, power_tests);
     ("Modular power function", `Quick, mod_power_tests);
     ("Modular power with prime modulo function", `Quick, prime_mod_power_tests)]
