(** Test suites for builtin basic_arithmetic ml file using alcotest. *)

open Alcotest
open Test_tools
open Basic_arithmetics

let sprintf = Printf.sprintf

let gcd_tests () =
    let cases = [(32, 6), 2; (18, 12), 6; (-18, -12), 6]
    and do_check ((a, b), expected) =
        check int (sprintf "gcd: %i and %i" a b) expected (gcd a b);
    in
    List.iter do_check cases

let bezout_tests () =
    let cases = [(18, 22), (5, -4, 2); (22, 18), (-4, 5, 2);
                 (17, 21), (5, -4, 1); (21, 17), (-4, 5, 1)]
    and do_check ((a, b), expected) =
        check
            (triplet int int int)
            (sprintf "bezout: %i and %i" a b)
            expected
            (bezout a b);
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let basic_arithmetics_set =
  [("GCD function", `Quick, gcd_tests);
   ("Bezout function", `Quick, bezout_tests)]
