
type jeton = Vrai | Faux | Var of char | Non | Et | Ou | ParenG | ParenD;;
type formule = jeton list;;
type env = (char * bool) list;;



let eval_op so sv = 
  match Stack.pop so, Stack.pop sv with 
                   | Non, Vrai  -> Stack.push Faux sv
                   | Non, Faux -> Stack.push Vrai sv
                   | Et, Vrai  -> ()
                   | Et, Faux  -> ignore(Stack.pop sv); Stack.push Faux sv 
                   | Ou, Vrai  -> ignore(Stack.pop sv); Stack.push Vrai sv 
                   | Ou, Faux  -> ()
                   | _ -> failwith "eval_op" 

let one_step  sv so env j = match j with 
  | Vrai | Faux -> Stack.push j sv
  | Var c -> Stack.push (List.assoc c env) sv
  | Non | Et | Ou -> Stack.push j so 
  | ParenG -> () 
  | ParenD -> eval_op so sv
;;

let eval env lj = 
  let sv = Stack.create() 
  and so = Stack.create() 
  in 
    List.iter (one_step sv so env) lj;
    while not (Stack.is_empty so) do 
        eval_op so sv
    done;
    Stack.pop sv
;;
