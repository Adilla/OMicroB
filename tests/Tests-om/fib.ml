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

(* $Id: fib.ml,v 1.1 2003/07/21 12:38:16 montela Exp $ *)

open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let rec fib n =
  if n < 2 then 1 else fib(n-1) + fib(n-2);;

  delay 2000;;
digital_write PIN11 HIGH;;
let x = ref 0 in
for i = 1 to 10 do
  x := fib 5
done;
if !x = fib 5 then digital_write PIN9 HIGH else digital_write PIN8 HIGH;;
digital_write PIN10 HIGH;;
  (*
let _ =
  let n =
    if Array.length Sys.argv >= 2 
    then int_of_string Sys.argv.(1)
    else 30 in
  print_int(fib n); print_newline(); exit 0

  *)
