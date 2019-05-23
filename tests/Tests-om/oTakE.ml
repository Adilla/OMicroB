

exception N of int;;

open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

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


let main () = 
    
  let x = ref 0 in
  for i = 1 to 2  do
    x := repeat 1
  done;
  if !x = repeat 1 
  then digital_write PIN9 HIGH 
  else digital_write PIN8 HIGH;;


delay 2000;;
digital_write PIN11 HIGH;;
main () ;; 
digital_write PIN10 HIGH;; 