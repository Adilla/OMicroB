(*

syrac.ml : ve'rification de la conjecture de syracuse 

             { u_n = 1    :  u_n+1 ->  1
             { u_n pair   :  u_n+1 -> u_n/2
             { u_n impair :  u_n+1 -> 3*u_n + 1  

           cette suite converge toujours vers 1 (conjecture)
           pour 23529 il y a 282 etapes avant convergence.

traits teste's : codage et ope'rations des entiers (mod, /, *, +)
                 re'cursivite' terminale


*)
open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec f x = 
  if x = 1 then 1
  else if x mod 2 = 0 then f(x/2)
	   else f(3*x+1)
	   ;;


let main() =
  let x = ref 0 in 
  for i = 1 to 10000 do 
    x := f (23529) 
  done;   (* 2 820 000 appels *)

  if !x = 1 then digital_write PIN9 HIGH else digital_write PIN8 HIGH;;


delay 2000;;
digital_write PIN11 HIGH;;
main () ;; 
digital_write PIN10 HIGH;; 


