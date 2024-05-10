(** Test suites for builtin basic_arithmetic ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
open Scalable_basic_arithmetics

let sprintf = Printf.sprintf

let gcd_b_tests () =
    let cases =
        [([0;0;0;0;0;0;1], [0;0;1;1]), [0;0;1];
         ([0;0;1;0;0;1], [0;0;0;1;1]), [0;0;1;1];
         ([1;0;1;0;0;1], [1;0;0;1;1]), [0;0;1;1]]
    and do_check ((a, b), expected) =
        check
            (list int)
            (sprintf "gcd_b: %s and %s" (string_of_intlist a) (string_of_intlist b))
            expected
            (gcd_b a b)
    in
    List.iter do_check cases

let bezout_b_tests () =
    let cases =
        [([0;0;1;0;0;1], [0;0;1;1;0;1]), ([0;1;0;1], [1;0;0;1], [0;0;1]);
         ([0;0;1;1;0;1], [0;0;1;0;0;1]), ([1;0;0;1], [0;1;0;1], [0;0;1]);
         ([0;1;0;0;0;1], [0;1;0;1;0;1]), ([0;1;0;1], [1;0;0;1], [0;1]);
         ([0;1;0;1;0;1], [0;1;0;0;0;1]), ([1;0;0;1], [0;1;0;1], [0;1])]
    and do_check ((a, b), expected) =
        check
            (triplet (list int) (list int) (list int))
            (sprintf "bezout_b: %s and %s" (string_of_intlist a) (string_of_intlist b))
            expected
            (bezout_b a b)
    in
    List.iter do_check cases


(****************************************************************************)
(****************************************************************************)

let basic_arithmetics_set =
    [("GCD on bitarrays function", `Quick, gcd_b_tests);
     ("Bezout on bitarrays function", `Quick, bezout_b_tests)]
