(*****************************************************************************)
(*****  Devellopement d'applications avec Objective Caml                 *****)
(*****                                                                   *****)
(*****  Solution des exercices : Chapitre 14                             *****)
(*****************************************************************************)

(* exercice 3 : Arbres lexicaux *)

(* 3.1 *)

pin_mode PIN1 OUTPUT;
digital_write PIN1 HIGH;
module type MOT =
 sig
  type alpha
  type t
  val null : t
  val of_alpha : alpha -> t
  val get : t -> int -> alpha
  val sub : t -> int -> int -> t
  val length : t -> int
  val concat : t -> t -> t
 end ;;


(* 3.2 *)

module ArbLex (M:MOT) =
  struct
    type node = Lettre of M.alpha * bool * t
    and t = node list

    let rec existe m d = 
      let  aux sm i n = 
        match d with
            [] -> false
          | (Lettre (a,b,l))::q when a = M.get sm i -> 
              if n = 1 then b else existe (M.sub sm (i+1) (n-1)) l       
          | (Lettre (a,b,l))::q when a = M.get sm i -> 
              existe sm q
    in aux m 0 (M.length m)

    let rec ajoute m d = 
      let aux sm i n = 
        if n = 0 then d 
        else 
          match d with 
              [] -> 
                let aux = ajoute (M.sub sm (i+1) (n-1)) [] in
                [ Lettre (M.get sm i, n = 1, aux) ] 
            | (Lettre(a,b,l))::q when a = M.get sm i ->
                if n = 1 then (Lettre(a,true,l))::q
                else Lettre(a,b,ajoute (M.sub sm (i+1) (n-1)) l)::q
            | (Lettre(a,b,l))::q -> (Lettre(a,b,l))::(ajoute sm q)
      in aux m 0 (M.length m)

    let rec selecte n d = match d with 
        [] -> []
      | (Lettre(a,b,l))::q when n=1 -> 
          let f (Lettre(a,b,_)) = if b then M.of_alpha a else M.null in 
          List.filter ((<>) M.null) (List.map f d) 
      | (Lettre(a,b,l))::q  -> 
          let r = selecte (n-1) l and r2 = selecte n q in
          let pr = List.map (function s -> M.concat (M.of_alpha a) s) r in
          pr@r2
  end ;;


(* 3.3 *)

module Chars =
  struct
    type alpha = char
    type t = string
    let null = ""
    let of_alpha c = String.make 1 c 

    let get s i = 
      try s.[i] 
      with Invalid_argument(_) -> raise (Invalid_argument "Chars.get")
    let sub s i1 i2 =
      try String.sub s i1 i2 
      with Invalid_argument(_) -> raise (Invalid_argument "Chars.sub")
    let length = String.length
    let concat = (^)
  end ;;

module CharsDic = ArbLex(Chars) ;;

let m = "Hello";;
let d = CharsDic.ajoute m [];;
match CharsDic.existe m d with
| true -> 0
| false -> 1;;
(* if CharsDic.existe m d then print_string "OK" else print_string "PB";; *)
(* print_newline();; *)
digital_write PIN1 LOW