(** Test suites for scalable encoding_msg ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
open Scalable_encoding_msg

let sprintf = Printf.sprintf

let encode_tests () =
    let cases =
        [(("Bashar", 7), [0;0;1;0;0;1;1;1;1;0;0;0;0;1;1;0;0;0;1;0;1;1;1;1;0;0;1;1;1;1;0;0;0;0;1;1;0;1;0;0;0;0;1])]
    and do_check ((str, bits), expected) =
        check
         (list int)
         (sprintf "encode: \"%s\" on %i bits" str bits)
         expected
         (encode str bits)
    in
    List.iter do_check cases

let decode_tests () =
    let cases =
        [((from_int 2294023860466, 7), "Bashar")]
    and do_check ((msg, bits), expected) =
        check
            string
            (sprintf "decode: %s on %i bits" (string_of_intlist msg) bits)
            expected
            (decode msg bits)
    in
    List.iter do_check cases

let encoding_msg_set =
    [("Encode with bitarrays function", `Quick, encode_tests);
     ("Decode with bitarrays function", `Quick, decode_tests)]
