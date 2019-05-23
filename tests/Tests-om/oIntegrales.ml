
open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let (>=.) a b = a >= b;;


let integrale f a b n =
  
  let h = (b -. a) /. (float_of_int n) in
  let rec integ x =
    if  x >=.  b then 0.0 else (f x) +. integ (x +. h) in 
  integ  a *. h
;;

let poly x = x *. x
;;


let rec repeat n =
  if n <= 0 then 0.0 else (repeat (n-1); integrale poly 0.0 1.0 10000)
;;


delay 2000;;
digital_write PIN11 HIGH;;
repeat 100;;
digital_write PIN10 HIGH;;



