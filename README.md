# AFIT

The AFIT (Standing for *Arithmetic for IT*) project has for for aim to
build first standard ciphering algorithms ; main aim being *RSA* and
*ElGamal* cryptosystems. Among other things we hope that you'll have
an first understanding of the difficulties underlying the need to use
big enough integer on a physical architecture which, by definition,
cannot handle infinitely big integers efficiently.

## Notional content

Needed theoretical content shall necessarily include

- Manipulating basic arithmetic operations and functions on
  natural numbers :

    - Quotient, modulo operations and euclidian division.
    - GCD computation and extended efficient GCD algorithm giving
      Bézout coefficients.
    - Being prime. Relative primality, Bézout Theorem.

- Modular arithmetic :
    - Definition of modulo of an integer with respect to some given
      positive natural number. Equality of two integers modulo such
      a natural.
    - Compatibility of modulo operation to addition and
      multiplication.
    - Given an integer $n > 1$ the $\mathbb{Z}/n\mathbb{Z}$ notation
      and canonical representants.
    - Fermat's Little Theorem.
    - Chinese Remainder Theorem in practice.
    - Notion of inversibility and inverse of an element in
      $\mathbb{Z}/n\mathbb{Z}$.
      Relation to Bézout Theorem.
    - Order of an element in $\mathbb{Z}/n\mathbb{Z}$. Multiplicative
      generators of $\mathbb{Z}/n\mathbb{Z}$.
    - Extension of Fermat's Little Theorem to the case of a product
      of two primes.

- Bit-wise operations :
    - Addition, substraction and multiplication and division of
      integers through their binary representation.

## Stages

Project is structured to enable each and every single student to find
themselves a working cryptosystem (as naive as it might be) by
deadline.

- `Stage 1`: Uses built-in `int` types. Implementing GCD, Bézout,
  (modular) exponentiations, primality and pseudo-primality tests,
  brute force generating primes with specific properties,
  encoding/decoding message, Caesar, RSA and ElGamal cryptosystem. A
  number of expected functions will have been implemented previously
  with possible light adaptations. ElGamal cryptosystem is potential
  extra ; needed maths are not accessible to all students.

- `Stage 2`: Observe that built-in implementation doesn't enable any
  seriously sized exchange of information. Use non-size-predefined
  integers through `OCaml` lists as containers for $1$ and $0$ dummy
  bits. First bit being a sign bit. Implement addition, substraction,
  multiplication and integer division on new integer
  type. Re-implement first stage functions to enable RSA
  encryption. Execute code to generate cryposystem having a higher
  number of bits than built-in integer.

- `Stage 3`: Observe that `Stage 2` implementation is highly time
  consuming. Try out the use of a an efficient data structure
  available within the module `Zarith` implemeting big integers. This
  stage is mostly about reading documentation, understanding the
  alcotest testing framework and thoroughly testing your code.

## Description of Root Directory

- `afit_file_*.pdf` : Contains files correponsding to maths content
  made available for students, both in english and french.

- `Source` : Containts ``.ml`` and ``.mli`` files corresponding to
  expected (hoped for) code to handout. It is organised by
  phase. Phases respectively corresponding to ``builtin``,
  ``scalable`` and ``zarithing``.

- `dune-project` : metadata for dune project.

- `.gitignore` : a gitignore file that avoids me having to deal with all your binaries.

- `README.md` : this readme file.
