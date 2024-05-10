(** Power function implementations for builtin integers *)

open Builtin
open Basic_arithmetics

(** Naive power function. Linear complexity
    @param x base
    @param n exponent
 *)
let pow x n =
    let rec comp x n =
      if n = 0 then
        1
      else
        x * comp x (n-1)
    in
    comp x n;;
    

(** Fast integer exponentiation function. Logarithmic complexity.
    @param x base
    @param n exponent
 *)
let power x n =
    let rec fp x n =
        match n with
        | 0 -> 1
        | 1 -> x
        | _ ->
            let b = fp x (n / 2) in
            if n mod 2 = 0 then
              b * b
            else
              x * b * b
   in fp x n;;

(** Fast modular exponentiation function. Logarithmic complexity.
    @param x base
    @param n exponent
    @param m modular base
 *)
let mod_power x n m =
   if n <= 0 then
      if n = 0 then
         1
      else
         invalid_arg("n must be positive")
   else
      let rec mod_power_rec xx nn mm = match nn with
         |0 -> 0
         |1 -> (modulo xx mm)
         |_ when (modulo nn 2) = 0 -> mod_power_rec (modulo ((modulo (xx) mm) * (modulo (xx) mm)) mm) (quot nn 2) mm
         |_ ->modulo ((modulo xx mm) * (mod_power_rec (modulo xx mm) (nn - 1) mm)) mm
      in mod_power_rec x n m;;

(** Fast modular exponentiation function mod prime. Logarithmic complexity.
    It makes use of the Little Fermat Theorem.
    @param x base
    @param n exponent
    @param p prime modular base
 *)
let prime_mod_power x n p =
   if x = 0 || x = 1 then
      x
   else
      let u = modulo n (p - 1)
      in mod_power x u p;;
