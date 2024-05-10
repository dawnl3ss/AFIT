(** Encoding Strings *)

(** Encode a string containing ASCII characters.
    @param str is a string representing message.
    @param bits number of bits on which to store a character ;
           alphanumeric ASCII is 7.
 *)
val encode : string -> int -> Z.t

(** Decode a string containing ASCII characters.
    @param msg is a big integer representing an encoded message.
    @param bits number of bits on which to store a character ;
           alphanumeric ASCII is 7.
 *)
val decode : Z.t -> int -> string
