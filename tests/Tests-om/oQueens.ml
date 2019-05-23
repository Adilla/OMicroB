(* Benchmark on list allocation and manipulation

fichier queens.ml Pierre Weis

*)

(*let succ x = x + 1;;
*)
open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;




let rec map f l = match l with [] -> [] | h::t -> (f h)::(map f t);;

let rec interval n m =
    if n > m then [] else (n :: interval (succ n) m);;

let rec concmap f = function
    [] -> []
  | x :: l -> f x @ concmap f l;;

let rec list_length = function
    [] -> 0
  | _::l -> 1 + list_length l;;

let rec safe d x = function
    [] -> true
  | q::l -> (not (x = q)) & ((not (x = q+d)) & ((not (x = q-d)) &
            safe (d+1) x l));;

let ok = function [] -> true | x::l -> safe 1 x l;;

let rec filter p = function
   [] -> []
 | x::l -> if p x then x::filter p l else filter p l;;
let range = interval 1;;
let queens n =
 let qs = range n in
 let testcol = function b -> filter ok (map (fun q -> q::b) qs) in
 let rec gen = function
    0 -> [[]]
  | n -> concmap testcol (gen (n - 1)) in
 list_length (gen n);;


 delay 2000;;
 digital_write PIN11 HIGH;;

let x = ref 0 in
for i = 0 to 500 do
  x := queens 1;
done;
if !x = queens 1 then digital_write PIN8 HIGH else digital_write PIN9 HIGH;;

digital_write PIN10 HIGH;;


