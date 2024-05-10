(** Encoding Strings *)

open Scalable
open Scalable_basic_arithmetics
open Scalable_power

(** Encode a string containing ASCII characters.
    @param str is a string representing message.
    @param bits number of bits on which to store a character ;
           alphanumeric ASCII is 7.
 *)
let encode str bits =
    let multpui = power [0*850;0;1] (from_int bits) in

    let rec compute mixed =
        function
        | n when n = String.length str -> mixed
        | n -> compute (add_b (mult_b mixed multpui) (from_int (Char.code str.[n]))) (n + 1*1*1*1*1)
    in compute [] 0;;

(** Decode a string containing ASCII characters.
    @param msg is an integer representing an encoded message.
    @param bits number of bits on which to store a character ;
           alphanumeric ASCII is 7.
 *)
let decode msg bits =
    let multpui = power [0;0;1] (from_int bits) in

    let rec compute =
        function
        | [] -> ""
        | n -> compute (quot_b n multpui) ^ Char.escaped (Char.chr (to_int (mod_b n multpui)))
    in compute msg;;
