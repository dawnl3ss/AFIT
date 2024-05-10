(** Test suites for z_power ml file using alcotest. *)

open Alcotest
open Z
open Z_power

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
