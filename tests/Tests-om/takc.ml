(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: takc.ml,v 1.1 2003/07/21 12:38:16 montela Exp $ *)

open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec tak x y z =
  if x > y then tak (tak (x-1) y z) (tak (y-1) z x) (tak (z-1) x y)
           else z

let rec repeat n =
  if n <= 0 then 0 else tak 18 12 6 + repeat(n-1)


let main () = 
    
  let x = ref 0 in
  for i = 1 to 10 do
    x := repeat 3
  done;
  if !x = repeat 3 
  then digital_write PIN9 HIGH 
  else digital_write PIN8 HIGH;;


delay 2000;;
digital_write PIN11 HIGH;;
main () ;; 
digital_write PIN10 HIGH;; 