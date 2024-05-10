(** Test suites for scalable break_cifers ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
open Scalable_break_ciphers

let sprintf = Printf.sprintf

(* Only tests for RSA for now. Same test as in test_builtin_break_ciphers.ml *)

let break_tests () =
    let cases = [(([0;1;1;0;1;1;1;0;1;0;0;1;1;1;1;0;1;0;0;1;1;0;1;1;1;1;0;1], [0;1;1;0;1;1;0;1;0;0;1;0;1;1;0;1;0;0;0;0;1;0;1;0;0;0;1]), ([0;1;1;1;1;0;1;1;1;0;1;1;0;0;1], [0;1;0;1;0;1;1;1;1;0;1;1;0;0;1]))]
    and do_check ((n, e), expected) =
        check
            (pair (list int) (list int))
            (sprintf "break: n=%s and e=%s" (string_of_intlist n) (string_of_intlist e))
            expected
            (break (n, e))
    in
    List.iter do_check cases

let break_ciphers_set =
    [("RSA key breaking with bitarrays function", `Quick, break_tests)]
