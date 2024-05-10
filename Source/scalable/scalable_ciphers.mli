(** Ciphers
    bitarrays based ciphers.
*)

(********** RSA Cipher **********)

(** Generate an RSA ciphering key.
    Involved prime bitarrays need to be distinct. Output is a couple
    of public, private keys.
    @param p prime bitarray
    @param q prime bitarray
*)
val generate_keys_rsa :
  int list -> int list -> ((int list) * (int list)) * ((int list) * (int list))

(** Encryption using RSA cryptosystem.
    @param m bitarray hash of message
    @param pub_key a tuple (n, e) composing public key of RSA cryptosystem.
 *)
val encrypt_rsa : int list -> ((int list) * (int list)) -> int list

(** Decryption using RSA cryptosystem.
    @param m integer hash of encrypter message.
    @param pub_key a tuple (n, d) composing private key of RSA cryptosystem.
 *)
val decrypt_rsa : int list -> ((int list) * (int list)) -> int list

(********** ElGamal Cipher **********)

(** Generate ElGamal public data. Generates a couple (g, p)
    where p is a prime bitarray and g a bitarray having high enough order modulo p.
    @param p is a prime bitarray having form 2*q + 1 for prime bitarray q.
 *)
val public_data_g : int list -> ((int list) * (int list))

(** Generate ElGamal public and private keys.
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
val generate_keys_g : ((int list) * (int list)) -> ((int list) * (int list))

(** ElGamal encryption process.
    @param msg message to be encrypted.
    @param pub_data a tuple (g, p) of ElGamal public data.
    @param kA ElGamal public key.
 *)
val encrypt_g : int list -> ((int list) * (int list)) -> int list -> ((int list) * (int list))

(** ElGamal decryption process.
    @param msg a tuple (msgA, msgB) forming an encrypted ElGamal message.
    @param a private key
    @param pub_data a tuple (g, p) of public data for ElGamal cryptosystem.
 *)
val decrypt_g : ((int list) * (int list)) -> int list -> ((int list) * (int list)) -> int list
