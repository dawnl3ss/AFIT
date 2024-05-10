open Alcotest
open Z
open Test_tools
open Test_z_power
open Test_z_test_primes
open Test_z_generate_primes
open Test_z_encoding_msg
open Test_z_ciphers
open Test_z_break_ciphers

let z_test_suite  = []

let () = run_to_xml "trace_zarithing_1.xml" [z_test_suite]
