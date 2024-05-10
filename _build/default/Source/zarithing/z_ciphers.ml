(** Ciphers
    Big integers based ciphers.
*)

open Z
open Z_power

(********** RSA Cipher **********)

(** Generate an RSA ciphering keys.
    Involved prime numbers need to be distinct. Output is a couple
    of public, private keys.
    @param p prime number
    @param q prime number
*)
let generate_keys_rsa p q =
    let n = p * q in
        let pp = (pred p) * (pred q) in
            let eq = pred (pp / (succ one)) in
                let d = invert eq pp in
    ((n, eq), (n, d));;

(** Encryption using RSA cryptosystem.
    @param m big integer hash of message
    @param pub_key a tuple (n, e) composing public key of RSA cryptosystem.
 *)
let encrypt_rsa m (n, e) =
    mod_power m e n;;

(** Decryption using RSA cryptosystem.
    @param m big integer hash of encrypter message.
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
    let kk = of_int (Random.int (to_int p)) in
    
    if mod_power kk p p <> one then
        (kk, p)
    else
        public_data_g p;;

(** Generate ElGamal public and private keys.
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
let generate_keys_g (g, p) =
    let pkk = of_int (Random.int (to_int p)) in

    (prime_mod_power g pkk p, pkk);;

(** ElGamal encryption process.
    @param msg message to be encrypted.
    @param pub_data a tuple (g, p) of ElGamal public data.
    @param kA ElGamal public key.
 *)
let encrypt_g msg (g, p) kA =
    let kk = of_int (Random.int ((to_int (pred (pred p))))) in

    (prime_mod_power g kk p, msg * (prime_mod_power kA kk p));;

(** ElGamal decryption process.
    @param msg a tuple (msgA, msgB) forming an encrypted ElGamal message.
    @param a private key
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
let decrypt_g (msgA, msgB) a (g, p) =
    div msgB (prime_mod_power msgA a p);;
