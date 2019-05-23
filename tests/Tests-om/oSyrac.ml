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


let rec f x = 
  if x = 1 then 1
  else if x mod 2 = 0 then f(x/2)
	   else f(3*x+1)
	   ;;

for i = 1 to 10000 do f (23529) done;;   (* 2 820 000 appels *)

if (f 23529) = 1 then print_string "OK" else print_string "PB";;
print_newline();;



