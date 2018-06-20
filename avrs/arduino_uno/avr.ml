type portb_bit = PB0 | PB1 | PB2 | PB3 | PB4 | PB5 | PB6 | PB7
type portc_bit = PC0 | PC1 | PC2 | PC3 | PC4 | PC5 | PC6 | PC7
type portd_bit = PD0 | PD1 | PD2 | PD3 | PD4 | PD5 | PD6 | PD7
type porte_bit = PE0 | PE1 | PE2 | PE3 | PE4 | PE5 | PE6 | PE7
type portf_bit = PF0 | PF1 | PF2 | PF3 | PF4 | PF5 | PF6 | PF7

type ddrb_bit = DB0 | DB1 | DB2 | DB3 | DB4 | DB5 | DB6 | DB7
type ddrc_bit = DC0 | DC1 | DC2 | DC3 | DC4 | DC5 | DC6 | DC7
type ddrd_bit = DD0 | DD1 | DD2 | DD3 | DD4 | DD5 | DD6 | DD7
type ddre_bit = DE0 | DE1 | DE2 | DE3 | DE4 | DE5 | DE6 | DE7
type ddrf_bit = DF0 | DF1 | DF2 | DF3 | DF4 | DF5 | DF6 | DF7

type pinb_bit = IB0 | IB1 | IB2 | IB3 | IB4 | IB5 | IB6 | IB7
type pinc_bit = IC0 | IC1 | IC2 | IC3 | IC4 | IC5 | IC6 | IC7
type pind_bit = ID0 | ID1 | ID2 | ID3 | ID4 | ID5 | ID6 | ID7
type pine_bit = IE0 | IE1 | IE2 | IE3 | IE4 | IE5 | IE6 | IE7
type pinf_bit = IF0 | IF1 | IF2 | IF3 | IF4 | IF5 | IF6 | IF7

type spcr_bit = SPR0 | SPR1 | CPHA | CPOL | MSTR | DORD | SPE | SPIE
type spsr_bit = SPI2x | SPSR1 | SPSR2 | SPSR3 | SPSR4 | SPSR5 | SPSR6 | SPIF
type spdr_bit = SPDR0 | SPDR1 | SPDR2 | SPDR3 | SPDR4 | SPDR5 | SPDR6 | SPDR7

type 'a register =
  | PORTB : portb_bit register
  | PORTC : portc_bit register
  | PORTD : portd_bit register
  | PORTE : porte_bit register
  | PORTF : portf_bit register
  | DDRB : ddrb_bit register
  | DDRC : ddrc_bit register
  | DDRD : ddrd_bit register
  | DDRE : ddre_bit register
  | DDRF : ddrf_bit register
  | PINB : pinb_bit register
  | PINC : pinc_bit register
  | PIND : pind_bit register
  | PINE : pine_bit register
  | PINF : pinf_bit register
  | SPCR : spcr_bit register
  | SPSR : spsr_bit register
  | SPDR : spsr_bit register

type ('a,'b,'c) pin =
  | PIN0  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN1  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN2  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN3  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN4  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN5  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN6  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN7  : (portd_bit register, ddrd_bit register, pind_bit register) pin
  | PIN8  : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PIN9  : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PIN10 : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PIN11 : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PIN12 : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PIN13 : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | MISO  : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | SCK   : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | MOSI  : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | SS    : (portb_bit register, ddrb_bit register, pinb_bit register) pin
  | PINA0 : (portc_bit register, ddrc_bit register, pinc_bit register) pin
  | PINA1 : (portc_bit register, ddrc_bit register, pinc_bit register) pin
  | PINA2 : (portc_bit register, ddrc_bit register, pinc_bit register) pin
  | PINA3 : (portc_bit register, ddrc_bit register, pinc_bit register) pin
  | PINA4 : (portc_bit register, ddrc_bit register, pinc_bit register) pin
  | PINA5 : (portc_bit register, ddrc_bit register, pinc_bit register) pin

type mode = INPUT | OUTPUT | INPUT_PULLUP

type level = LOW | HIGH

let port_of_pin : type a b c . (a register, b register, c register) pin -> a register =
  function
  | PIN0 -> PORTD
  | PIN1 -> PORTD
  | PIN2 -> PORTD
  | PIN3 -> PORTD
  | PIN4 -> PORTD
  | PIN5 -> PORTD
  | PIN6 -> PORTD
  | PIN7 -> PORTD
  | PIN8 -> PORTB
  | PIN9 -> PORTB
  | PIN10 -> PORTB
  | PIN11 -> PORTB
  | PIN12 -> PORTB
  | PIN13 -> PORTB
  | MISO -> PORTB
  | SCK -> PORTB
  | MOSI -> PORTB
  | SS -> PORTB
  | PINA0 -> PORTC
  | PINA1 -> PORTC
  | PINA2 -> PORTC
  | PINA3 -> PORTC
  | PINA4 -> PORTC
  | PINA5 -> PORTC

let ddr_of_pin : type a b c. (a register , b register, c register) pin -> b register=
  function
  | PIN0 -> DDRD
  | PIN1 -> DDRD
  | PIN2 -> DDRD
  | PIN3 -> DDRD
  | PIN4 -> DDRD
  | PIN5 -> DDRD
  | PIN6 -> DDRD
  | PIN7 -> DDRD
  | PIN8 -> DDRB
  | PIN9 -> DDRB
  | PIN10 -> DDRB
  | PIN11 -> DDRB
  | PIN12 -> DDRB
  | PIN13 -> DDRB
  | MISO -> DDRB
  | SCK -> DDRB
  | MOSI -> DDRB
  | SS -> DDRB
  | PINA0 -> DDRC
  | PINA1 -> DDRC
  | PINA2 -> DDRC
  | PINA3 -> DDRC
  | PINA4 -> DDRC
  | PINA5 -> DDRC


let input_of_pin : type a b c. (a register , b register, c register) pin -> c register=
  function
  | PIN0 -> PIND
  | PIN1 -> PIND
  | PIN2 -> PIND
  | PIN3 -> PIND
  | PIN4 -> PIND
  | PIN5 -> PIND
  | PIN6 -> PIND
  | PIN7 -> PIND
  | PIN8 -> PINB
  | PIN9 -> PINB
  | PIN10 -> PINB
  | PIN11 -> PINB
  | PIN12 -> PINB
  | PIN13 -> PINB
  | MISO -> PINB
  | SCK -> PINB
  | MOSI -> PINB
  | SS -> PINB
  | PINA0 -> PINC
  | PINA1 -> PINC
  | PINA2 -> PINC
  | PINA3 -> PINC
  | PINA4 -> PINC
  | PINA5 -> PINC

let port_bit_of_pin : type a b c. (a register, b register, c register) pin -> a =
  function
  | PIN0 -> PD0
  | PIN1 -> PD1
  | PIN2 -> PD2
  | PIN3 -> PD3
  | PIN4 -> PD4
  | PIN5 -> PD5
  | PIN6 -> PD6
  | PIN7 -> PD7
  | PIN8 -> PB0
  | PIN9 -> PB1
  | PIN10 -> PB2
  | PIN11 -> PB3
  | PIN12 -> PB4
  | PIN13 -> PB5
  | MISO -> PB4
  | SCK -> PB5
  | MOSI -> PB3
  | SS -> PB0
  | PINA0 -> PC0
  | PINA1 -> PC1
  | PINA2 -> PC2
  | PINA3 -> PC3
  | PINA4 -> PC4
  | PINA5 -> PC5


let ddr_bit_of_pin : type a b c. (a register, b register, c register) pin -> b =
  function
  | PIN0 -> DD0
  | PIN1 -> DD1
  | PIN2 -> DD2
  | PIN3 -> DD3
  | PIN4 -> DD4
  | PIN5 -> DD5
  | PIN6 -> DD6
  | PIN7 -> DD7
  | PIN8 -> DB0
  | PIN9 -> DB1
  | PIN10 -> DB2
  | PIN11 -> DB3
  | PIN12 -> DB4
  | PIN13 -> DB5
  | MISO -> DB4
  | SCK -> DB5
  | MOSI -> DB3
  | SS -> DB0
  | PINA0 -> DC0
  | PINA1 -> DC1
  | PINA2 -> DC2
  | PINA3 -> DC3
  | PINA4 -> DC4
  | PINA5 -> DC5


let input_bit_of_pin : type a b c. (a register, b register, c register) pin -> c =
  function
  | PIN0 -> ID0
  | PIN1 -> ID1
  | PIN2 -> ID2
  | PIN3 -> ID3
  | PIN4 -> ID4
  | PIN5 -> ID5
  | PIN6 -> ID6
  | PIN7 -> ID7
  | PIN8 -> IB0
  | PIN9 -> IB1
  | PIN10 -> IB2
  | PIN11 -> IB3
  | PIN12 -> IB4
  | PIN13 -> IB5
  | MISO -> IB4
  | SCK -> IB5
  | MOSI -> IB3
  | SS -> IB0
  | PINA0 -> IC0
  | PINA1 -> IC1
  | PINA2 -> IC2
  | PINA3 -> IC3
  | PINA4 -> IC4
  | PINA5 -> IC5


external write_register : 'a register -> int -> unit = "caml_avr_write_register" [@@noalloc]
external read_register : 'a register -> int = "caml_avr_read_register" [@@noalloc]
external set_bit : 'a register -> 'a -> unit = "caml_avr_set_bit" [@@noalloc]
external clear_bit : 'a register -> 'a -> unit = "caml_avr_clear_bit" [@@noalloc]
external read_bit : 'a register -> 'a -> bool = "caml_avr_read_bit" [@@noalloc]
external delay : int -> unit = "caml_avr_delay" [@@noalloc]

let pin_mode p m =
  let port = port_of_pin p in
  let bit = port_bit_of_pin p in
  let ddr_bit = ddr_bit_of_pin p in
  let ddr = ddr_of_pin p in
  match m with
  | OUTPUT ->
    set_bit ddr ddr_bit
  | INPUT ->
    clear_bit ddr ddr_bit;
    clear_bit port bit
  | INPUT_PULLUP ->
    clear_bit ddr ddr_bit;
    set_bit port bit

let digital_write p b =
  let port = port_of_pin p in
  let bit = port_bit_of_pin p in
  match b with
  | HIGH -> set_bit port bit
  | LOW -> clear_bit port bit

let digital_read p =
  let input = input_of_pin p in
  let ibit = input_bit_of_pin p in
  match read_bit input ibit with
  | true -> HIGH
  | false -> LOW