(*

pgcd.ml : calcul du pgcd de 2 entiers par la me'thode d'Euclide

             pgcd (a,b) =  si a mod b = 0, -> b
                           sinon  -> pgcd(b, a mod b)

traits teste's : codage et ope'rations des entiers (mod)
                 re'cursivite' terminale
                 fonction curryfie'e


*)

open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec pgcd a b = if a mod b = 0 then b else pgcd b (a mod b);;


delay 2000;;
digital_write PIN11 HIGH;;
let x = ref 0 in
for i = 1 to 20000 do
  x := pgcd 500 32;
done;
if !x = pgcd 500 32 then digital_write PIN8 HIGH else digital_write PIN9 HIGH;;

digital_write PIN10 HIGH;;