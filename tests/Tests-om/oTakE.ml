exception N of int;;



let rec ctak_aux x y z =
  if x>y
  then ctak_aux (try ctak_aux (x-1) y z with N r -> r)
                (try ctak_aux (y-1) z x with N r -> r)
                (try ctak_aux (z-1) x y with N r -> r)
  else raise (N z)
;;

let rec ctak x y z =
  try ctak_aux x y z with N r -> r
;;

let rec repeat n =
  if n <= 0 then 0 else (ctak 18 12 6) + repeat (n-1)
;;

repeat 5;;

(* print_int (repeat 5); print_newline() 
;; *)
