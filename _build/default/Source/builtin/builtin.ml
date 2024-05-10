(** Tweaking OCaml builtin euclidean division

The OCaml built-in euclidian divisions operations do not follow the
standard mathematical conventions. We adapt OCaml available
primitives to suit maths conventions.

 **)

let sign x =
  if x >= 0 then
    1
  else
    -1;;

let quot a b =
    let qq = a/b and rr = a mod b in
        if rr >= 0 then
            qq
        else
            qq - (sign b);;


let modulo a b =
  let mo = a mod b in
  if mo < 0 then
    mo + b
  else
    mo;;

let div a b =
    let qq = a/b and rr = a mod b in
      if rr >= 0 then
          (qq, rr)
      else
          (qq - (sign b), rr + (sign b) * b);;
 
