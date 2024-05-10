(** Encoding Strings *)

open Z
open Z_power

(** Encode a string containing ASCII characters.
    @param str is a string representing message.
    @param bits number of bits on which to store a character ; alphanumeric ASCII is 7.
 *)
let encode str bits =
    let lngt = of_int (String.length(str)) in

    let rec ecrr i j sum =
        match i with
        | _ when (succ i = zero) || j >= (succ lngt) -> sum
        | _ -> ecrr (pred i) (succ j) (sum + (of_int (int_of_char str.[to_int i]) * (pow (pow (succ one) bits) (to_int(j)))))
    in ecrr (pred lngt) zero zero;;

(** Decode a string containing ASCII characters.
    @param msg is an integer representing an encoded message.
    @param bits number of bits on which to store a character ; alphanumeric ASCII is 7.
 *)
let decode msg bits =
    let rec dcrr msg bits =
        match msg with
        | _ when msg = zero -> ""
        | _ ->
            let pwin = pow (succ one) bits in
            dcrr (msg / pwin) bits ^ Char.escaped (char_of_int (to_int(msg mod pwin)))
    in dcrr msg bits;;
