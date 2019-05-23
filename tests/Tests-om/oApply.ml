

let double = fun f x -> f (f x);;

let quad x  = double double  x;;
let oct x = quad quad x;;


let succ x = x + 1;;

let rec repeat n =
  if n <= 0 then 0 else (repeat (n-1); double oct succ 1)
;;

