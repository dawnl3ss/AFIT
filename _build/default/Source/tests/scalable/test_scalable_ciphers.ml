(** Test suites for builtin cifers ml file using alcotest. **)

open Alcotest
open Test_tools
open Scalable
open Scalable_basic_arithmetics
open Scalable_ciphers

let sprintf = Printf.sprintf

(** Mêmes cas que dans test_builtin_ciphers.ml **)

let generate_keys_rsa_tests () =
    let cases = [(([0;1;1;1;1;0;1;1;1;0;1;1;0;0;1], [0;1;0;1;0;1;1;1;1;0;1;1;0;0;1]), true)]
    and do_check ((p, q), expected) =
        (* Here, `expected` is a boolean telling if the generated `e` and `d`
         * are the inverse of each other modulo `n` *)
        let ((_, e), (n, d)) = generate_keys_rsa p q
        and phin = mult_b (diff_b p [0;1]) (diff_b q [0;1])
        and is_inverse x y n = mod_b (mult_b (mod_b x n) (mod_b y n)) n = [0; 1]
        in
        check
            bool
            (sprintf "generate_rsa_keys: with %s and %s (we check if e is the inverse of d modulo n)"
                (string_of_intlist p)
                (string_of_intlist q))
            true
            (is_inverse e d phin)
    in
    List.iter do_check cases

let encrypt_rsa_tests () =
    let cases =
        [(([0;1;0;1;0;1;0;0;1;0;1;0;1;0;0;1;0;0;0;1], ([0;1;1;0;1;1;1;0;1;0;0;1;1;1;1;0;1;0;0;1;1;0;1;1;1;1;0;1], [0;1;1;0;1;1;0;1;0;0;1;0;1;1;0;1;0;0;0;0;1;0;1;0;0;0;1])), [0;1;0;0;0;0;0;1;1;0;0;0;1;0;1;0;0;0;1;1;1;0;1;0;0;0;0;1])]
    and do_check ((m, (n, e)), expected) =
        check
            (list int)
            (sprintf "encrypt_rsa: %s with n=%s and e=%s"
                (string_of_intlist m)
                (string_of_intlist n)
                (string_of_intlist e))
            expected
            (encrypt_rsa m (n, e))
    in
    List.iter do_check cases

let decrypt_rsa_tests () =
    let cases =
        [(([0;1;0;0;0;0;0;1;1;0;0;0;1;0;1;0;0;0;1;1;1;0;1;0;0;0;0;1], ([0;1;1;0;1;1;1;0;1;0;0;1;1;1;1;0;1;0;0;1;1;0;1;1;1;1;0;1], [0;1;1;0;0;1;1;0;1;0;0;0;1;0;0;0;0;1;1;1;0;1;0;1;1;1])), [0;1;0;1;0;1;0;0;1;0;1;0;1;0;0;1;0;0;0;1])]
    and do_check ((m, (n, e)), expected) =
        check
            (list int)
            (sprintf "decrypt_rsa: %s with n=%s and e=%s"
                (string_of_intlist m)
                (string_of_intlist n)
                (string_of_intlist e))
            expected
            (decrypt_rsa m (n, e))
    in
    List.iter do_check cases

(* Test for ElGamal *)

let el_gamal_tests () =
    let cases = [([0;1;1;1;0;0;0;0;0;1;0;0;0;0;1;1;1;1;0;1;0;1;1;1;1;1;0;1], [0;0;1;0;1;0;1])]
    and do_check (p, msg) =
        (* No need for an expected value, we encrypt and decrypt a message so
         * the expected result is the original message *)
        let (g, p) = public_data_g p in
        let (pub, priv) = generate_keys_g (g, p) in
        let (g_k, xA_k) = encrypt_g msg (g, p) pub in
        check
            (list int)
            (sprintf "el_gamal functions: keys generated with g=%s, message %s is encrypted and then decrypted, we check if the result is equal to the original message"
                (string_of_intlist p)
                (string_of_intlist msg))
            msg
            (decrypt_g (g_k, xA_k) priv (g, p))
    in
    List.iter do_check cases

let ciphers_set =
    [("Generate RSA keys with bitarrays function", `Quick, generate_keys_rsa_tests);
     ("RSA encryption with bitarrays function", `Quick, encrypt_rsa_tests);
     ("RSA decryption with bitarrays function", `Quick, decrypt_rsa_tests);
     ("El Gamal cryptosystem with bitarrays functions", `Quick, el_gamal_tests)]
