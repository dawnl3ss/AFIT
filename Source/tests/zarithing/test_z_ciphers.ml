(** Test suites for builtin cifers ml file using alcotest. *)

open Alcotest
open Z
open Test_tools
open Z_ciphers

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
