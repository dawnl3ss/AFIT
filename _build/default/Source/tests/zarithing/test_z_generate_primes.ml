(** Test suites for big int generate primes ml file using alcotest. *)

open Alcotest
open Z
module P = Z_test_primes
open Z_generate_primes

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
