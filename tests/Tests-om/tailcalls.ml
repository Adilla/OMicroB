open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec tailcall4 a b c d =
  if a < 0
  then b
  else tailcall4 (a-1) (b+1) (c+2) (d+3)

let rec tailcall8 a b c d e f g h =
  if a < 0
  then b
  else tailcall8 (a-1) (b+1) (c+2) (d+3) (e+4) (f+5) (g+6) (h+7)

let rec tailcall16 a b c d e f g h i j k l m n o p =
  if a < 0
  then b
  else tailcall16 (a-1) (b+1) (c+2) (d+3) (e+4) (f+5) (g+6) (h+7)
                  (i+8) (j+9) (k+10) (l+11) (m+12) (n+13) (o+14) (p+15)

let indtailcall8 fn a b c d e f g h =
  fn a b c d e f g h

let indtailcall16 fn a b c d e f g h i j k l m n o p =
  fn a b c d e f g h i j k l m n o p 

let main () =
  (* let x1 = ref 0 in
  let x2 = ref 0 in
  let x3 = ref 0 in
  let x4 = ref 0 in *)
  let x5 = ref 0 in
(* 
   x1 := (tailcall4 10000000 0 0 0);
   x2 := (tailcall8 10000000 0 0 0 0 0 0 0); *)
   x5 := (tailcall16 10000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0);
   (* x4 := (indtailcall8 tailcall8 10 0 0 0 0 0 0 0); *)
   (* x5 := (indtailcall16 tailcall16 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0); *)

  (* if !x1 = (tailcall4 10000000 0 0 0)
  && !x2 = (tailcall8 10000000 0 0 0 0 0 0 0)
  && !x3 = (tailcall16 10000000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  && !x4 = (indtailcall8 tailcall8 10 0 0 0 0 0 0 0) *)
  if !x5 = (tailcall16 10000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  then digital_write PIN9 HIGH
  else digital_write PIN8 HIGH;;

delay 2000;;
digital_write PIN11 HIGH;;
main () ;; 
digital_write PIN10 HIGH;; 