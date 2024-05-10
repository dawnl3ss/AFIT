(** Ciphers
    Big integers based ciphers.
*)

(********** RSA Cipher **********)

(** Generate an RSA ciphering keys.
    Involved prime numbers need to be distinct. Output is a couple
    of public, private keys.
    @param p prime number
    @param q prime number
*)
val generate_keys_rsa : Z.t -> Z.t -> ((Z.t * Z.t) * (Z.t * Z.t))


(** Encryption using RSA cryptosystem.
    @param m integer hash of message
    @param pub_key a tuple (n, e) composing public key of RSA cryptosystem.
 *)
val encrypt_rsa : Z.t -> (Z.t * Z.t) -> Z.t


(** Decryption using RSA cryptosystem.
    @param m big integer hash of encrypter message.
    @param pub_key a tuple (n, d) composing private key of RSA cryptosystem.
 *)
val decrypt_rsa : Z.t -> (Z.t * Z.t) -> Z.t


(********** ElGamal Cipher **********)

(** Generate ElGamal public data. Generates a couple (g, p)
    where p is prime and g primitive root in F_p.
    @param p is prime having form 2*q + 1 for prime q.
 *)
val public_data_g : Z.t -> (Z.t * Z.t)


(** Generate ElGamal public and private keys.
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
val generate_keys_g : (Z.t * Z.t) -> (Z.t * Z.t)


(** ElGamal encryption process.
    @param msg message to be encrypted.
    @param pub_data a tuple (g, p) of ElGamal public data.
    @param kA ElGamal public key.
 *)
val encrypt_g : Z.t -> (Z.t * Z.t) -> Z.t -> (Z.t * Z.t)


(** ElGamal decryption process.
    @param msg a tuple (msgA, msgB) forming an encrypted ElGamal message.
    @param a private key
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
val decrypt_g : (Z.t * Z.t) -> Z.t -> (Z.t * Z.t) -> Z.t
