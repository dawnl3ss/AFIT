(** Test suites for builtin break_cifers ml file using alcotest. *)

open Alcotest
open Break_ciphers

let sprintf = Printf.sprintf

(* Only tests for RSA for now. *)

let break_tests () =
    let cases = [((99400891, 36199003), (9967, 9973))]
    and do_check ((n, e), expected) =
        check
            (pair int int)
            (sprintf "break: n=%i and e=%i" n e)
            expected
            (break (n, e))
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let break_ciphers_set =
    [("RSA key breaking function", `Quick, break_tests)]
