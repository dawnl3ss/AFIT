(** Chinese remainder theorem *)

open Builtin
open Basic_arithmetics

(** Image of the Chinese Remainder map
    @param x positive integer of which you take image
    @param l list of pairwise relatively prime positive integers.
 *)
let crt_image x l =
    let t = [] in
    
    let rec cc x l t =
        match l with
        | [] -> t
        | e::l -> cc x l ((x mod e)::t)
    in cc x l t

(** Inverse image of Chinese Remainder map
    @para m a positive integer
    @param l list of pairwise relatively prime factors of m
    @param y list of remainders modulo pairwise relatively prime factors of m
 *)
let crt_solver m l y = 0
