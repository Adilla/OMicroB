(* --------- DERIVATIVE    (R.P. Gabriel  p170)
   Appels de fonctions et filtrage *)

   (* Fichier deriv.ml, Pierre Weis *)
(*
Camlot
5.1u 3.6s 0:08.76 100.4% 0+7662k 0+0io 0pf+0w
Caml Light
45.9u 7.5s 0:53.53 100.0% 0+10579k 0+0io 0pf+0w
*)


open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;
let rec map f = function [] -> [] | h::t -> (f h)::(map f t);;

type operator = P | M | T | D;;

type dexpr = Numb of int
	| Symbole of string
	| Dexpr of operator * (dexpr list);;

let rec derive =
  let deriv_aux a = Dexpr (D,[derive a; a]) in
  function
    Numb _ -> Numb 0
  | Symbole "x" -> Numb 1
  | Symbole _ -> Numb 0
  | Dexpr (P, lexpr) -> Dexpr (P, map derive lexpr)
  | Dexpr (M, lexpr) -> Dexpr (M, map derive lexpr)
  | Dexpr (T, lexpr) as a -> Dexpr (T, [a ; Dexpr (P, map deriv_aux lexpr)])
  | Dexpr (D, [a1;a2])
           -> Dexpr (M, [Dexpr (D, [derive a1 ; a2]) ;
			Dexpr (D, [a1 ; Dexpr (T, [a2;a2;derive a2])])])
 	    (* FORMULA IS WRONG BUT NEVER USED IN TEST *)
| _ -> failwith "derive";;

let pol = Dexpr (P, [Dexpr (T, [Numb 3; Symbole "x"; Symbole "x"]) ;
                     Dexpr (T, [Symbole "a"; Symbole "x"; Symbole "x"]) ;
                     Dexpr (T, [Symbole "b"; Symbole "x"]) ;
                     Numb 5]);;
let res = ref pol;;

let main() =
	for i = 0 to 1 do		      
	      res := derive pol;
	done;;

delay 2000;;
digital_write PIN11 HIGH;;

main();;

digital_write PIN10 HIGH;;
