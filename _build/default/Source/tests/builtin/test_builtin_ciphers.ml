(** Test suites for builtin cifers ml file using alcotest. *)

open Alcotest
open Test_tools
open Ciphers

let sprintf = Printf.sprintf
let modulo = Builtin.modulo

let str2list_f str f =
 let rec __str2list i =
   if i >= String.length str then
        []
   else
     (f str.[i])::__str2list (i + 1)
 in
 __str2list 0

let str2list str =
  str2list_f str (function x -> Char.code x)

let encrypt_cesar_tests () =
    let cases = [((2,  [2; 3; 6],         10), [4; 5; 8]);
                 ((0,  str2list "hello", 255), str2list "hello");
                 ((2,  str2list "ABC",   255), str2list "CDE");
                 ((-1, str2list "xyz",   255), str2list "wxy")]
    and do_check ((k, m, b), expected) =
        check
            (list int)
            (sprintf "encrypt_cesar: key: %i, word: %s, base: %i"
                k
                (string_of_intlist m)
                b)
            expected
            (encrypt_cesar k m b)
    in
    List.iter do_check cases

let decrypt_cesar_tests () =
    let cases = [((2,  [4; 5; 8],         10), [2; 3; 6]);
                 ((0,  str2list "hello", 255), str2list "hello");
                 ((2,  str2list "CDE",   255), str2list "ABC");
                 ((-1, str2list "wxy",   255), str2list "xyz")]
    and do_check ((k, m, b), expected) =
        check
            (list int)
            (sprintf "decrypt_cesar: key: %i, word: %s, base: %i"
                k
                (string_of_intlist m)
                b)
            expected
            (decrypt_cesar k m b)
    in
    List.iter do_check cases

let generate_keys_rsa_tests () =
    let cases = [((9967, 9973), true)]
    and do_check ((p, q), expected) =
        (* Here, `expected` is a boolean telling if the generated `e` and `d`
         * are the inverse of each other modulo `n` *)
        let ((_, e), (n, d)) = generate_keys_rsa p q
        and phin = (p-1) * (q-1)
        and is_inverse x y n = modulo ((modulo x n) * (modulo y n)) n = 1 in
        check
            bool
            (sprintf "generate_rsa_keys: with %i and %i (we check if e is the inverse of d modulo n)" p q)
            true
            (if modulo e phin = 1 then false else is_inverse e d phin)
    in
    List.iter do_check cases

let encrypt_rsa_tests () =
    let cases = [((281237, (99400891, 36199003)), 70133953)]
    and do_check ((m, (n, e)), expected) =
        check int (sprintf "encrypt_rsa: %i with n=%i and e=%i" m n e) expected (encrypt_rsa m (n, e))
    in
    List.iter do_check cases

let decrypt_rsa_tests () =
    let cases = [((70133953, (99400891, 30869683)), 281237)]
    and do_check ((m, (n, e)), expected) =
        check int (sprintf "decrypt_rsa: %i with n=%i and e=%i" m n e) expected (decrypt_rsa m (n, e))
    in
    List.iter do_check cases

(* Test for ElGamal *)

let el_gamal_tests () =
    let cases = [(100000007, 42)]
    and do_check (p, msg) =
        (* No need for an expected value, we encrypt and decrypt a message so
         * the expected result is the original message *)
        let (g, p) = public_data_g p in
        let (pub, priv) = generate_keys_g (g, p) in
        let (g_k, xA_k) = encrypt_g msg (g, p) pub in
        check
            int
            (sprintf "el_gamal functions: keys generated with p=%i, message %i is encrypted and then decrypted, we check if the result is equal to the original message"
                     p msg)
            msg
            (decrypt_g (g_k, xA_k) priv (g, p))
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let ciphers_set =
    [("Cesar encryption function", `Quick, encrypt_cesar_tests);
     ("Cesar decryption function", `Quick, decrypt_cesar_tests);
     ("Generate RSA keys function", `Quick, generate_keys_rsa_tests);
     ("RSA encryption function", `Quick, encrypt_rsa_tests);
     ("RSA decryption function", `Quick, decrypt_rsa_tests);
     ("El Gamal cryptosystem functions", `Quick, el_gamal_tests)]
