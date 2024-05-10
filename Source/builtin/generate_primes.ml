(** Generating primes *)

open Builtin
open Basic_arithmetics

(** List composed of 2 and then odd integers starting at 3.
    @param n limit of list of odd integers, minimum value is 2.
 *)
let init_eratosthenes n =
  let n = abs(n) in
  let rec erat num i =
       match num with
       | n when i > num -> []
       | _ -> i::erat num (i+2)
  in 2::erat n 3;;

(** Eratosthene sieve.
    @param n limit of list of primes, starting at 2.
*)
let eratosthenes n =
  if n < 2 then
    invalid_arg "min value is 2"
  else
    let rec delete x = function
      | [] -> []
      | e::l when e mod x = 0 -> delete x l
      | e::l -> e :: delete x l
    in let rec era i = function
      | [] -> []
      | e::l ->
        if i = n then
          [i]
        else
          e::era (i/e) (delete e l)
    in era 2 (init_eratosthenes n);;

(** Write a list into a file. Element seperator is newline.
    @param file path to write to.
 *)
let write_list li file =
  let oc = open_out file in
  let rec wl = function
      [] -> close_out oc
    | e::l -> Printf.fprintf oc "%i\n" e; wl l
  in wl li;;

(** Write a list of prime numbers up to limit into a txt file.
    @param n limit of prime numbers up to which to build up a list of primes.
    @param file path to write to.
*)
let write_list_primes n file =
  write_list (eratosthenes n) file;;

(** Read file safely ; catch End_of_file exception.
    @param in_c input channel.
 *)
let input_line_opt in_c =
  try Some (input_line in_c)
  with End_of_file -> None

(** Create a list out of reading a line per line channel.
    @param in_c input channel.
 *)
let create_list in_c =
  let rec _create_list in_c =
    match input_line_opt in_c with
    | Some line -> (int_of_string line)::(_create_list in_c)
    | None -> []
  in
  _create_list in_c;;

(** Load list of primes into OCaml environment.
    @param file path to load from.
 *)
let read_list_primes file =
  let inf = open_in file in 
  create_list inf;;

(** Get biggest prime.
    @param l list of prime numbers.
 *)
let rec last_element l = match l with
  | [] -> failwith "You're list is empty. "
  | e::[] -> e
  | h::t -> last_element t

(** Get two biggest primes.
    @param l list of prime numbers.
 *)
let rec last_two l = match l with
  | [] | [_] -> failwith "List has to have at least two prime numbers."
  | e::g::[] -> (e, g)
  | h::t -> last_two t

(** Finding couples of primes where second entry is twice the first
    plus 1.
    @param limit positive integer bounding searched for primes.
    @param isprime function testing for (pseudo)primality.
 *)
let double_primes limit isprime =
  let rec recdp d =
    match d with
    | d when d == limit -> []
    | d when isprime d && isprime (d*2+1) -> (d, d*2+1)::recdp (d+1)
    | _ -> recdp (d+1)
  in recdp 2;;

(** Finding twin primes.
    @param limit positive integer bounding searched for primes.
    @param isprime function testing for (pseudo)primality.
 *)
let twin_primes limit isprime =
  let rec rectw x =
    match x with
    | x when x == limit -> []
    | x when isprime x && isprime (x + (2/2) + 1) -> (x, x + (2/2) + 1)::rectw (x + 1)
    | _ -> rectw (x + 1)
  in rectw 2;;
