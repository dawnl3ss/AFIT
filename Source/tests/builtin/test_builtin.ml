(** Test suites for builtin builtin ml file using alcotest. *)

open Alcotest
open Builtin

let sprintf = Printf.sprintf

let sign_tests () =
    let cases = [(1, 1); (-1, -1); (0, 1)]
    and do_check (n, expected) =
        check int (sprintf "sign: %i" n)  expected (sign n)
    in
    List.iter do_check cases

let quot_tests () =
    let cases = [(10, 3), 3; (-10, 3), -4; (10, 2), 5; (-10, 2), -5]
    and do_check ((a, b), expected) =
        check int (sprintf "quot: %i/%i" a b)  expected (quot a b);
    in
    List.iter do_check cases

let modulo_tests () =
    let cases = [(10, 3), 1; (-10, 3), 2; (10, 2), 0; (-10, 2), 0]
    and do_check ((n, m), expected) =
        check int (sprintf "modulo: %i [%i]" n m) expected (modulo n m);
    in
    List.iter do_check cases

let div_tests () =
    let cases = [(10, 3), (3, 1); (-10, 3), (-4, 2);
                 (10, 2), (5, 0); (-10, 2), (-5, 0)]
    and do_check ((a, b), expected) =
        check (pair int int) (sprintf "div: %i/%i" a b) expected (div a b);
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let builtin_set =
  [("Sign function", `Quick, sign_tests);
   ("Quot function", `Quick, quot_tests);
   ("Modulo function", `Quick, modulo_tests);
   ("div function", `Quick, div_tests)]
