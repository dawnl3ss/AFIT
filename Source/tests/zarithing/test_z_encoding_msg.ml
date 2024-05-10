(** Test suites for big int encoding_msg ml file using aclotest. *)

open Alcotest
open Z
open Z_encoding_msg

let sprintf = Printf.sprintf
let zt = testable pp_print Z.equal
