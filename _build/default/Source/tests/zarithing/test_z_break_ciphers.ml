(** Test suites for big int break_cifers ml file using alcotest. *)

open Alcotest
open Z
open Z_break_ciphers

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
