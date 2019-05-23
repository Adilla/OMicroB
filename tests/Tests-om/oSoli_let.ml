open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;

let incr x = x:=!x+1;;


type peg = Out | Empty | Peg;;

let board = [|
 [| Out; Out; Out; Out; Out; Out; Out; Out; Out|];
 [| Out; Out; Out; Peg; Peg; Peg; Out; Out; Out|];
 [| Out; Out; Out; Peg; Peg; Peg; Out; Out; Out|];
 [| Out; Peg; Peg; Peg; Peg; Peg; Peg; Peg; Out|];
 [| Out; Peg; Peg; Peg; Empty; Peg; Peg; Peg; Out|];
 [| Out; Peg; Peg; Peg; Peg; Peg; Peg; Peg; Out|];
 [| Out; Out; Out; Peg; Peg; Peg; Out; Out; Out|];
 [| Out; Out; Out; Peg; Peg; Peg; Out; Out; Out|];
 [| Out; Out; Out; Out; Out; Out; Out; Out; Out|]
|]
;;

(*let moves = make_vect 31 ([||] : int vect vect);;*)
let moves = Array.create 31 ([||] : int array array);;

let dir = [| [|0;1|]; [|1;0|];[|0;-1|];[|-1;0|] |];;

let counter = ref 0;;

exception Found;;

let rec solve m =

  incr counter;
  if m = 31 then
    begin match board.(4).(4) with Peg -> true | _ -> false end
  else
    try
     
      for i=1 to 7 do
      for j=1 to 7 do
        match board.(i).(j) with
          Peg ->
            for k=0 to 3 do
              let d1 = dir.(k).(0) in
              let d2 = dir.(k).(1) in
              let i1 = i+d1 in
              let i2 = i1+d1 in
              let j1 = j+d2 in
              let j2 = j1+d2 in
              match board.(i1).(j1) with
                Peg ->
                  begin match board.(i2).(j2) with
                    Empty ->
                      board.(i).(j) <- Empty;
                      board.(i1).(j1) <- Empty;
                      board.(i2).(j2) <- Peg;
                      if solve(m+1) then begin
                        moves.(m) <- [| [| i; j |]; [| i2; j2 |] |];
                        raise Found
                      end;
                      board.(i).(j) <- Peg;
                      board.(i1).(j1) <- Peg;
                      board.(i2).(j2) <- Empty;
                      ()
                    | _ -> ()
                  end
              | _ -> ()
            done
        | _ -> ()
      done
      done;
      false
    with Found ->
      true
;;



let main() =
  let x = ref true in 
  for i = 1 to 2 do 
    x := solve 1
  done;   (* 2 820 000 appels *)

  if !x = solve 1 then digital_write PIN9 HIGH else digital_write PIN8 HIGH;;


delay 2000;;
digital_write PIN11 HIGH;;
main () ;; 
digital_write PIN10 HIGH;; 


(*
.........
...   ...
...   ...
.       .
.   $   .
.       .
...   ...
...   ...
.........
*)
