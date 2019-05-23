open Avr;;

pin_mode PIN11 OUTPUT;;
pin_mode PIN10 OUTPUT;;
pin_mode PIN9 OUTPUT;;
pin_mode PIN8 OUTPUT;;
(* 
 while true do 
  digital_write PIN11 HIGH; 
  digital_write PIN10 LOW;
  digital_write PIN9 LOW;
  digital_write PIN8 LOW;
  delay 100;
  digital_write PIN11 LOW;
  digital_write PIN10 HIGH;
  digital_write PIN9 LOW;
  digital_write PIN8 LOW;
  delay 100;
  digital_write PIN11 LOW;
  digital_write PIN10 LOW;
  digital_write PIN9 HIGH;
  digital_write PIN8 LOW;
  delay 100;
  digital_write PIN11 LOW;
  digital_write PIN10 LOW;
  digital_write PIN9 LOW;
  digital_write PIN8 HIGH;
  delay 100;
done;;    *)


let make_vect = Array.create;;
type 'a vect = 'a array;;
let sigma p n =
let v = make_vect  (n+1)   0.0 
in
  for j=1 to p do
    for i=1 to n do v.(i)<-float_of_int(i) done;
    for i=1 to n do 
	  v.(i)<-((v.(i-1))+.(v.(i)))
	  done
  done;
  v.(n) ;;

  delay 2000;;
digital_write PIN11 HIGH;;
  

let x = ref 0.0 in
for i = 1 to 2 do
  x := sigma 5 5;
done;
if !x = sigma 5 5 then digital_write PIN9 HIGH else digital_write PIN8 HIGH;;
digital_write PIN10 HIGH;;

(* let r = 50005000.0;; *)
