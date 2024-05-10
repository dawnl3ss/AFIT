(** Ciphers
    bitarrays based ciphers.
*)

open Scalable
open Scalable_basic_arithmetics
open Scalable_power

let rec ext a b =
    if a = [] then
       (b, [], [0;1])
    else
       let (g, y, x) = ext (mod_b b a) a in
       (g, (diff_b x (mult_b (quot_b b a) y)), y);;
 
let upside e prp =
    let g, c, d = ext e prp in

    if g <> [0;1] then
        invalid_arg "pas possible"
    else
       mod_b c prp;;


(********** RSA Cipher **********)

(** Generate an RSA ciphering key.
    Involved prime bitarrays need to be distinct. Output is a couple
    of public, private keys.
    @param p prime bitarray
    @param q prime bitarray
*)
let generate_keys_rsa p q =
    let n = mult_b p q in
        let prp = mult_b (diff_b p [0;1]) (diff_b q [0;1]) in
            let li = [0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1] in
                let d = upside li prp in
    ((n, li), (n, d));;
    

(** Encryption using RSA cryptosystem.
    @param m bitarray hash of message
    @param pub_key a tuple (n, e) composing public key of RSA cryptosystem.
 *)
let encrypt_rsa m (n, e) =
    mod_power m e n;;

(** Decryption using RSA cryptosystem.
    @param m bitarray hash of encrypted message.
    @param pub_key a tuple (n, d) composing private key of RSA cryptosystem.
 *)
let decrypt_rsa m (n , d) =
    mod_power m d n;;

(********** ElGamal Cipher **********)

(** Generate ElGamal public data. Generates a couple (g, p)
    where p is a prime bitarray and g a bitarray having high enough order modulo p.
    @param p is a prime bitarray having form 2*q + 1 for prime bitarray q.
 *)
let rec public_data_g p =
    let k = from_int(Random.int(to_int(p))) in

    if mod_power k p p <> [0;1] then
       (k, p)
    else
       public_data_g p;;


(** Generate ElGamal public data.
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)

let generate_keys_g (g, p) =
    let priv = from_int(Random.int(to_int(p))) in

    (prime_mod_power g priv p, priv);;

(** ElGamal encryption process.
    @param msg message to be encrypted.
    @param pub_data a tuple (g, p) of ElGamal public data.
    @param kA ElGamal public key.
 *)
let encrypt_g msg (g, p) kA =
    let key = from_int(Random.int(to_int(p) - 2) + 2) in
    (prime_mod_power g key p, (mult_b msg (prime_mod_power kA key p)));;

(** ElGamal decryption process.
    @param msg a tuple (msgA, msgB) forming an encrypted ElGamal message.
    @param a private key
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
let decrypt_g (msgA, msgB) a (g, p) =
    quot_b msgB (prime_mod_power msgA a p);;
