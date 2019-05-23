(* fac.ml *)



open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec fac = function
   0 -> 1
| n -> n*fac(n-1)
;;

delay 2000;;
digital_write PIN11 HIGH;;
let x = ref 0 in
for i = 1 to 2 do
  x := fac 50;
done;
if !x = fac 50 then digital_write PIN8 HIGH else digital_write PIN9 HIGH;;
digital_write PIN10 HIGH;;

(*digital_write PIN1 LOW;;*)