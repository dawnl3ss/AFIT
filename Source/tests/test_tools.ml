open Alcotest
open Junit
open Junit_alcotest

let _string_of_printablelist string_of_e l =
    let rec string_of_content = function
        [] -> ""
      | [e] -> string_of_e e
      | e::l -> string_of_e e ^ ", " ^ string_of_content l
    in
    "[" ^ string_of_content l ^ "]"

let string_of_intlist = _string_of_printablelist string_of_int

(* for printing list of bitarrays *)
let string_of_intlistlist = _string_of_printablelist string_of_intlist

let triplet a_t b_t c_t = (* new testable type constructor for alcotest *)
    let pp_triplet pp_a pp_b pp_c ppf (a, b, c) = (* pretty printer *)
        Format.fprintf ppf "(%a, %a, %a)" pp_a a pp_b b pp_c c
    in
    testable (pp_triplet (pp a_t) (pp b_t) (pp c_t)) (=)

let run_to_xml file test_suites =
  let rec _flatten test_suites =
    match test_suites with
    | [] -> []
    | test_suite::t ->  test_suite @ _flatten t
  in
  let rec _run_and_report test_suite =
    match test_suite with
    | [] -> []
    | (name, test_cases)::t ->
       let junit_case, _ = run_and_report name [(name, test_cases)]
       in junit_case::_run_and_report t
  in to_file (make (_run_and_report (_flatten test_suites))) file
