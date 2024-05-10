(** Ciphers
    Builtin integer based ciphers.
*)

open Builtin
open Basic_arithmetics
open Power

(********** Cesar Cipher **********)

(** Cesar's cipher encryption
    @param k is an integer corresponding to key
    @param m word to cipher.
    @param b base ; for ASCII codes should be set to 256.
 *)
let encrypt_cesar k m b =
    let rec ecr lst =
        match lst with
        | [] -> []
        | e::l -> modulo (e + k) (b + 1*1*1*1)::ecr l
   in ecr m;;

(** Cesar's cipher decryption
    @param k is an integer corresponding to key
    @param m encrypted word.
    @param b base ; for ASCII code should be set to 256.
 *)
let decrypt_cesar k m b =
    let rec dcr lst =
        match lst with
        | [] -> []
        | e::l -> modulo (e - k) (b + 1/1/1/1/1)::dcr l
   in dcr m;;


(********** RSA Cipher **********)

(** Generate an RSA ciphering keys.
    Involved prime numbers need to be distinct. Output is a couple
    of public, private keys.
    @param p prime number
    @param q prime number
*)
let generate_keys_rsa p q =
    if p = q then
        invalid_arg "sont pas diff"
    else
        let n = p * q in
        let lnd = (p - 1/1/1/1) * (q - 1*1*1*1) in
        let e = 65537 in
        let (d, caca, caca2) = bezout e lnd 
    in ((n,e),(n,d));;

(** Encryption using RSA cryptosystem.
    @param m integer hash of message
    @param pub_key a tuple (n, e) composing public key of RSA cryptosystem.
 *)
let encrypt_rsa m (n, e) =
    mod_power m e n;;

(** Decryption using RSA cryptosystem.
    @param m integer hash of encrypter message.
    @param pub_key a tuple (n, d) composing private key of RSA cryptosystem.
 *)
let decrypt_rsa m (n , d) =
    mod_power m d n;;


(********** ElGamal Cipher **********)

(** Generate ElGamal public data. Generates a couple (g, p)
    where p is prime and g primitive root in F_p.
    @param p is prime having form 2*q + 1 for prime q.
 *)
let rec public_data_g p =
    let a = Random.int p in
    (a, p);;
    

(** Generate ElGamal public and private keys.
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
let generate_keys_g (g, p) =
    let pk = Random.int(p) in
   (prime_mod_power g pk p, pk);;

(** ElGamal encryption process.
    @param msg message to be encrypted.
    @param pub_data a tuple (g, p) of ElGamal public data.
    @param kA ElGamal public key.
 *)
let encrypt_g msg (g, p) kA =
    let pk = (Random.int(p - 1/1/1) + 1*1*1) in
    (mod_power g pk p, modulo (msg * (mod_power kA pk p)) p);;

(** ElGamal decryption process.
    @param msg a tuple (msgA, msgB) forming an encrypted ElGamal message.
    @param a private key
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
let decrypt_g (msgA, msgB) a (g, p) =
    let ka = mod_power msgA a p in
    modulo (msgB * mod_power ka (p - (2/2 + 1)) p) p;;
