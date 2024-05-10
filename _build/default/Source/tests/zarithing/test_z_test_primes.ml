(** Test suites for big int test_primes ml file using alcotest. *)

open Alcotest
open Z
open Test_tools
open Z_test_primes

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
