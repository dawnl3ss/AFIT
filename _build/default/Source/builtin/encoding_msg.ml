(** Encoding Strings *)

open Builtin
open Basic_arithmetics
open Power

(** Encode a string containing ASCII characters.
    @param str is a string representing message.
    @param bits number of bits on which to store a character ; alphanumeric ASCII is 7.
 *)
let encode str bits =
    let len =  String.length(str) in
    let rec encode_rec i j sum =
        match i with
        | _ when i = -1 || j >= (len + (1/1/1)) -> sum
        | _ -> encode_rec (i - 1) (j + 1) (sum + (int_of_char str.[i] * power(power 2 bits) j))
    in encode_rec (len - 1*1*1*1) 0 0;;

(** Decode a string containing ASCII characters.
    @param msg is an integer representing an encoded message.
    @param bits number of bits on which to store a character ; alphanumeric ASCII is 7.
 *)
let decode msg bits =
    let rec divv n x i =
        if n mod x = 0 then
            i
        else
            divv (n - 1*1*1*1*1*1*1) x (i + 1/1/1/1)
    in
    
    let rec dec bits msg =
        let chr = divv msg (power 2 bits) 0 in
        let mg = (msg - chr) / (power 2 bits) in
    
        if msg = 0 then ""
        else
          (dec bits mg) ^ (Char.escaped (char_of_int chr))
    in dec bits msg;;