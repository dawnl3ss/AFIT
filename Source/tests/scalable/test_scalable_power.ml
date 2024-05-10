(** Test suites for scalable power ml file using alcotest. *)

open Alcotest
open Test_tools
open Scalable
open Scalable_power

let sprintf = Printf.sprintf

let pow_tests () =
    let cases =
        [(([1;1], [0;0;0;1;1]), [0;1]);
         (([1;1], [0;1;1;0;1]), [1;1]);
         ((from_int 0,    [0;0;1]),  from_int 0);
         (([0;1;1],    [0;1]),  [0;1;1]);
         (([0;1;0;1],    from_int 0),  [0;1]);
         (([1;0;1], [0;0;1]),  [0;0;0;1]);
         (([1;0;1], [0;1;1]),  [1;0;0;0;1]);
         (([0;0;1],    [0;1;0;1]),  [0;0;0;0;0;0;1]);
         (([0;1;1],    [0;1;1]),  [0;1;1;0;1;1])]
     and do_check ((x, n), expected) =
         check
            (list int)
            (sprintf "pow: %s^%s" (string_of_intlist x) (string_of_intlist n))
            expected
            (pow x n)
    in
    List.iter do_check cases

let power_tests () =
    let cases = [(([1;1], [0;0;0;1;1]), [0;1]);
                 (([1;1], [0;1;1;0;1]), [1;1]);
                 ((from_int 0,    [0;0;1]),  from_int 0);
                 (([0;1;1],    [0;1]),  [0;1;1]);
                 (([0;1;0;1],    from_int 0),  [0;1]);
                 (([1;0;1], [0;0;1]),  [0;0;0;1]);
                 (([1;0;1], [0;1;1]),  [1;0;0;0;1]);
                 (([0;0;1],    [0;1;0;1]),  [0;0;0;0;0;0;1]);
                 (([0;1;1],    [0;1;1]),  [0;1;1;0;1;1])]
     and do_check ((x, n), expected) =
         check
            (list int)
            (sprintf "power: %s^%s" (string_of_intlist x) (string_of_intlist n))
            expected
            (power x n)
    in
    List.iter do_check cases

let mod_power_tests () =
    let cases =  [(([1;1], [0;0;0;1;1], [0;0;1;0;1]), [0;1]);
                  (([1;1], [0;1;1;0;1], [0;1;1;0;1]), [0;0;1;0;1]);
                  ((from_int 0,    [0;0;1],  [0;1;1]),  from_int 0);
                  (([0;1;1],    [0;1],  [0;1;1]),  from_int 0);
                  (([0;1;0;1],    from_int 0,  [0;0;1]),  [0;1]);
                  (([1;0;1], [0;0;1],  [0;1;0;1]),  [0;0;0;1]);
                  (([1;0;1], [0;1;1],  from_int 9),  [0;1]);
                  (([0;0;1],    [0;1;0;1],  [0;1;0;0;0;1]), [0;1;1;1;1]);
                  (([0;1;1],    [0;1;1],  [0;1;0;0;0;1]), [0;0;1;0;1])]
    and do_check ((x, n, m), expected) =
        check
            (list int)
            (sprintf "%s^%s modulo %s"
                        (string_of_intlist x)
                        (string_of_intlist n)
                        (string_of_intlist m))
            expected
            (mod_power x n m)
    in
    List.iter do_check cases

let prime_mod_power_tests () =
    let cases = [(([1;1], [0;0;0;1;1], [0;1;1;1]),  [0;1]);
                 (([1;1], [0;1;1;0;1], [0;1;1;0;1]), [0;0;1;0;1]);
                 ((from_int 0,    [0;0;1],  [0;1;1]),  from_int 0);
                 (([0;1;1],    [0;1],  [0;1;1]),  from_int 0);
                 (([0;1;0;1],    from_int 0,  [0;0;1]),  [0;1]);
                 (([1;0;1], [0;0;1],  [0;1;0;1]),  [0;0;0;1]);
                 (([1;0;1], [0;1;1],  [0;1;0;1]),  [0;0;1]);
                 (([0;0;1],    [0;1;0;1],  [0;1;0;0;0;1]), [0;1;1;1;1]);
                 (([0;1;1],    [0;1;1],  [0;1;0;0;0;1]), [0;0;1;0;1])]
    and do_check ((x, n, p), expected) =
        check
            (list int)
            (sprintf "%s^%s modulo %s"
                        (string_of_intlist x)
                        (string_of_intlist n)
                        (string_of_intlist p))
            expected (prime_mod_power x n p)
    in
    List.iter do_check cases

(****************************************************************************)
(****************************************************************************)

let power_set =
    [("Pow on bitarrays function", `Quick, pow_tests);
     ("Power on bitarrays function", `Quick, power_tests);
     ("Modular power on bittarays function", `Quick, mod_power_tests);
     ("Modular power with prime modulo on bitarrays function", `Quick, prime_mod_power_tests)]
