#define OCAML_STACK_WOSIZE               200
#define OCAML_STATIC_HEAP_WOSIZE           0
#define OCAML_DYNAMIC_HEAP_WOSIZE        200
#define OCAML_FLASH_HEAP_WOSIZE           53
#define OCAML_STACK_INITIAL_WOSIZE         2
#define OCAML_RAM_GLOBDATA_NUMBER          1
#define OCAML_FLASH_GLOBDATA_NUMBER        6
#define OCAML_BYTECODE_BSIZE             616
#define OCAML_PRIMITIVE_NUMBER             3
#define OCAML_VIRTUAL_ARCH                32
#define OCAML_STARTING_OOID                1
#define OCAML_NO_FLASH_HEAP                0
#define OCAML_NO_FLASH_GLOBALS             0

#define OCAML_GC_MARK_AND_COMPACT

#include </home/adilla/Documents/VmMic/Tools/OMicroB/src/byterun/vm/values.h>

#define OCAML_ACC0                        0
#define OCAML_ACC1                        1
#define OCAML_ACC2                        2
#define OCAML_PUSH                        3
#define OCAML_PUSHACC1                    4
#define OCAML_PUSHACC2                    5
#define OCAML_PUSHACC3                    6
#define OCAML_PUSHACC4                    7
#define OCAML_PUSHACC5                    8
#define OCAML_POP                         9
#define OCAML_ASSIGN                     10
#define OCAML_APPLY1                     11
#define OCAML_APPLY2                     12
#define OCAML_APPTERM1                   13
#define OCAML_APPTERM2                   14
#define OCAML_RETURN                     15
#define OCAML_RESTART                    16
#define OCAML_GRAB                       17
#define OCAML_CLOSURE_1B                 18
#define OCAML_CLOSUREREC_1B              19
#define OCAML_PUSHOFFSETCLOSURE0         20
#define OCAML_PUSHGETRAMGLOBAL_1B        21
#define OCAML_PUSHGETFLASHGLOBAL_1B      22
#define OCAML_SETRAMGLOBAL_1B            23
#define OCAML_MAKEBLOCK1                 24
#define OCAML_GETFIELD0                  25
#define OCAML_SETFIELD0                  26
#define OCAML_BRANCH_2B                  27
#define OCAML_BRANCHIF_1B                28
#define OCAML_BRANCHIFNOT_1B             29
#define OCAML_SWITCH_1B                  30
#define OCAML_CHECK_SIGNALS              31
#define OCAML_C_CALL1                    32
#define OCAML_C_CALL2                    33
#define OCAML_CONST0                     34
#define OCAML_CONST1                     35
#define OCAML_CONST2                     36
#define OCAML_CONST3                     37
#define OCAML_CONSTINT_1B                38
#define OCAML_CONSTINT_2B                39
#define OCAML_PUSHCONST1                 40
#define OCAML_PUSHCONST3                 41
#define OCAML_PUSHCONSTINT_1B            42
#define OCAML_PUSHCONSTINT_2B            43
#define OCAML_MULINT                     44
#define OCAML_DIVINT                     45
#define OCAML_MODINT                     46
#define OCAML_NEQ                        47
#define OCAML_GTINT                      48
#define OCAML_OFFSETINT_1B               49
#define OCAML_BNEQ_1B                    50
#define OCAML_BLEINT_1B                  51
#define OCAML_BGTINT_1B                  52
#define OCAML_STOP                       53

value ocaml_stack[OCAML_STACK_WOSIZE];
value ocaml_ram_heap[OCAML_STATIC_HEAP_WOSIZE + OCAML_DYNAMIC_HEAP_WOSIZE];
value ocaml_ram_global_data[OCAML_RAM_GLOBDATA_NUMBER];

PROGMEM value const ocaml_flash_heap[OCAML_FLASH_HEAP_WOSIZE] = {
  /*  0 */  Make_header(0, 0, Color_white),
  /*  1 */  Make_header(2, Object_tag, Color_white),
  /*  2 */  Val_flash_block(&ocaml_flash_heap[5]),
  /*  3 */  Val_int(-1),
  /*  4 */  Make_header(4, String_tag, Color_white),
  /*  5 */  Make_string_data('O', 'u', 't', '_'),
  /*  6 */  Make_string_data('o', 'f', '_', 'm'),
  /*  7 */  Make_string_data('e', 'm', 'o', 'r'),
  /*  8 */  Make_string_data('y', '\0', '\0', '\2'),
  /*  9 */  Make_header(2, Object_tag, Color_white),
  /* 10 */  Val_flash_block(&ocaml_flash_heap[13]),
  /* 11 */  Val_int(-3),
  /* 12 */  Make_header(2, String_tag, Color_white),
  /* 13 */  Make_string_data('F', 'a', 'i', 'l'),
  /* 14 */  Make_string_data('u', 'r', 'e', '\0'),
  /* 15 */  Make_header(2, Object_tag, Color_white),
  /* 16 */  Val_flash_block(&ocaml_flash_heap[19]),
  /* 17 */  Val_int(-4),
  /* 18 */  Make_header(5, String_tag, Color_white),
  /* 19 */  Make_string_data('I', 'n', 'v', 'a'),
  /* 20 */  Make_string_data('l', 'i', 'd', '_'),
  /* 21 */  Make_string_data('a', 'r', 'g', 'u'),
  /* 22 */  Make_string_data('m', 'e', 'n', 't'),
  /* 23 */  Make_string_data('\0', '\0', '\0', '\3'),
  /* 24 */  Make_header(2, Object_tag, Color_white),
  /* 25 */  Val_flash_block(&ocaml_flash_heap[28]),
  /* 26 */  Val_int(-6),
  /* 27 */  Make_header(5, String_tag, Color_white),
  /* 28 */  Make_string_data('D', 'i', 'v', 'i'),
  /* 29 */  Make_string_data('s', 'i', 'o', 'n'),
  /* 30 */  Make_string_data('_', 'b', 'y', '_'),
  /* 31 */  Make_string_data('z', 'e', 'r', 'o'),
  /* 32 */  Make_string_data('\0', '\0', '\0', '\3'),
  /* 33 */  Make_header(2, Object_tag, Color_white),
  /* 34 */  Val_flash_block(&ocaml_flash_heap[37]),
  /* 35 */  Val_int(-9),
  /* 36 */  Make_header(4, String_tag, Color_white),
  /* 37 */  Make_string_data('S', 't', 'a', 'c'),
  /* 38 */  Make_string_data('k', '_', 'o', 'v'),
  /* 39 */  Make_string_data('e', 'r', 'f', 'l'),
  /* 40 */  Make_string_data('o', 'w', '\0', '\1'),
  /* 41 */  Make_header(1, Closure_tag, Color_white),
  /* 42 */  Val_codeptr(30),
  /* 43 */  Make_header(1, Closure_tag, Color_white),
  /* 44 */  Val_codeptr(387),
  /* 45 */  Make_header(1, Closure_tag, Color_white),
  /* 46 */  Val_codeptr(183),
  /* 47 */  Make_header(1, Closure_tag, Color_white),
  /* 48 */  Val_codeptr(81),
  /* 49 */  Make_header(1, Closure_tag, Color_white),
  /* 50 */  Val_codeptr(285),
  /* 51 */  Make_header(1, Closure_tag, Color_white),
  /* 52 */  Val_codeptr(4)
};

PROGMEM value const ocaml_initial_static_heap[OCAML_STATIC_HEAP_WOSIZE] = {
};

PROGMEM value const ocaml_initial_stack[OCAML_STACK_INITIAL_WOSIZE] = {
  /* 0 */  Val_int(11),
  /* 1 */  Val_int(1)
};

PROGMEM value const ocaml_flash_global_data[OCAML_FLASH_GLOBDATA_NUMBER] = {
  /* 0 */  Val_flash_block(&ocaml_flash_heap[44]),
  /* 1 */  Val_flash_block(&ocaml_flash_heap[46]),
  /* 2 */  Val_flash_block(&ocaml_flash_heap[48]),
  /* 3 */  Val_flash_block(&ocaml_flash_heap[50]),
  /* 4 */  Val_flash_block(&ocaml_flash_heap[52]),
  /* 5 */  Val_flash_block(&ocaml_flash_heap[42])
};

value acc = Val_flash_block(&ocaml_flash_heap[42]);
value env = Val_unit;

#define OCAML_Out_of_memory        Val_flash_block(&ocaml_flash_heap[2])
#define OCAML_Failure              Val_flash_block(&ocaml_flash_heap[10])
#define OCAML_Invalid_argument     Val_flash_block(&ocaml_flash_heap[16])
#define OCAML_Division_by_zero     Val_flash_block(&ocaml_flash_heap[25])
#define OCAML_Stack_overflow       Val_flash_block(&ocaml_flash_heap[34])

#define OCAML_atom0                Val_flash_block(&ocaml_flash_heap[1])

PROGMEM opcode_t const ocaml_bytecode[OCAML_BYTECODE_BSIZE] = {
  /*   0 */  OCAML_BRANCH_2B, 2, 52,
  /*   3 */  OCAML_RESTART,
  /*   4 */  OCAML_GRAB, 1,
  /*   6 */  OCAML_ACC0,
  /*   7 */  OCAML_PUSHGETFLASHGLOBAL_1B, 0,
  /*   9 */  OCAML_APPLY1,
  /*  10 */  OCAML_PUSHACC1,
  /*  11 */  OCAML_PUSHGETFLASHGLOBAL_1B, 1,
  /*  13 */  OCAML_APPLY1,
  /*  14 */  OCAML_PUSHACC3,
  /*  15 */  OCAML_BRANCHIFNOT_1B, 8,
  /*  17 */  OCAML_ACC0,
  /*  18 */  OCAML_PUSHACC2,
  /*  19 */  OCAML_C_CALL2, 0,
  /*  21 */  OCAML_RETURN, 4,
  /*  23 */  OCAML_ACC0,
  /*  24 */  OCAML_PUSHACC2,
  /*  25 */  OCAML_C_CALL2, 1,
  /*  27 */  OCAML_RETURN, 4,
  /*  29 */  OCAML_RESTART,
  /*  30 */  OCAML_GRAB, 1,
  /*  32 */  OCAML_ACC0,
  /*  33 */  OCAML_PUSHGETFLASHGLOBAL_1B, 0,
  /*  35 */  OCAML_APPLY1,
  /*  36 */  OCAML_PUSHACC1,
  /*  37 */  OCAML_PUSHGETFLASHGLOBAL_1B, 1,
  /*  39 */  OCAML_APPLY1,
  /*  40 */  OCAML_PUSHACC2,
  /*  41 */  OCAML_PUSHGETFLASHGLOBAL_1B, 2,
  /*  43 */  OCAML_APPLY1,
  /*  44 */  OCAML_PUSHACC3,
  /*  45 */  OCAML_PUSHGETFLASHGLOBAL_1B, 3,
  /*  47 */  OCAML_APPLY1,
  /*  48 */  OCAML_PUSHACC5,
  /*  49 */  OCAML_SWITCH_1B, 3, 0, 6, 16, 22,
  /*  55 */  OCAML_ACC1,
  /*  56 */  OCAML_PUSHACC1,
  /*  57 */  OCAML_C_CALL2, 1,
  /*  59 */  OCAML_ACC2,
  /*  60 */  OCAML_PUSHACC4,
  /*  61 */  OCAML_C_CALL2, 1,
  /*  63 */  OCAML_RETURN, 6,
  /*  65 */  OCAML_ACC1,
  /*  66 */  OCAML_PUSHACC1,
  /*  67 */  OCAML_C_CALL2, 0,
  /*  69 */  OCAML_RETURN, 6,
  /*  71 */  OCAML_ACC1,
  /*  72 */  OCAML_PUSHACC1,
  /*  73 */  OCAML_C_CALL2, 1,
  /*  75 */  OCAML_ACC2,
  /*  76 */  OCAML_PUSHACC4,
  /*  77 */  OCAML_C_CALL2, 0,
  /*  79 */  OCAML_RETURN, 6,
  /*  81 */  OCAML_ACC0,
  /*  82 */  OCAML_SWITCH_1B, 70, 0, 73, 76, 79, 83, 83, 87, 87, 79, 83, 90, 79, 83, 90, 94, 76, 73, 76, 73, 87, 98, 76, 73, 73, 76, 98, 87, 79, 83, 90, 94, 94, 90, 83, 79, 87, 98, 76, 73, 94, 98, 76, 73, 94, 90, 83, 79, 87, 98, 76, 73, 87, 76, 98, 73, 73, 76, 98, 87, 79, 83, 90, 94, 73, 76, 98, 87, 79, 83, 90, 94,
  /* 155 */  OCAML_CONST0,
  /* 156 */  OCAML_RETURN, 1,
  /* 158 */  OCAML_CONST1,
  /* 159 */  OCAML_RETURN, 1,
  /* 161 */  OCAML_CONSTINT_1B, 4,
  /* 163 */  OCAML_RETURN, 1,
  /* 165 */  OCAML_CONSTINT_1B, 5,
  /* 167 */  OCAML_RETURN, 1,
  /* 169 */  OCAML_CONST3,
  /* 170 */  OCAML_RETURN, 1,
  /* 172 */  OCAML_CONSTINT_1B, 6,
  /* 174 */  OCAML_RETURN, 1,
  /* 176 */  OCAML_CONSTINT_1B, 7,
  /* 178 */  OCAML_RETURN, 1,
  /* 180 */  OCAML_CONST2,
  /* 181 */  OCAML_RETURN, 1,
  /* 183 */  OCAML_ACC0,
  /* 184 */  OCAML_SWITCH_1B, 70, 0, 73, 76, 79, 83, 83, 87, 87, 79, 83, 90, 79, 83, 90, 94, 76, 73, 76, 73, 87, 98, 76, 73, 73, 76, 98, 87, 79, 83, 90, 94, 94, 90, 83, 79, 87, 98, 76, 73, 94, 98, 76, 73, 94, 90, 83, 79, 87, 98, 76, 73, 87, 76, 98, 73, 73, 76, 98, 87, 79, 83, 90, 94, 73, 76, 98, 87, 79, 83, 90, 94,
  /* 257 */  OCAML_CONST0,
  /* 258 */  OCAML_RETURN, 1,
  /* 260 */  OCAML_CONST1,
  /* 261 */  OCAML_RETURN, 1,
  /* 263 */  OCAML_CONSTINT_1B, 4,
  /* 265 */  OCAML_RETURN, 1,
  /* 267 */  OCAML_CONSTINT_1B, 5,
  /* 269 */  OCAML_RETURN, 1,
  /* 271 */  OCAML_CONST3,
  /* 272 */  OCAML_RETURN, 1,
  /* 274 */  OCAML_CONSTINT_1B, 6,
  /* 276 */  OCAML_RETURN, 1,
  /* 278 */  OCAML_CONSTINT_1B, 7,
  /* 280 */  OCAML_RETURN, 1,
  /* 282 */  OCAML_CONST2,
  /* 283 */  OCAML_RETURN, 1,
  /* 285 */  OCAML_ACC0,
  /* 286 */  OCAML_BGTINT_1B, 39, 31,
  /* 289 */  OCAML_ACC0,
  /* 290 */  OCAML_BGTINT_1B, 42, 77,
  /* 293 */  OCAML_ACC0,
  /* 294 */  OCAML_BGTINT_1B, 54, 15,
  /* 297 */  OCAML_ACC0,
  /* 298 */  OCAML_BGTINT_1B, 62, 7,
  /* 301 */  OCAML_CONSTINT_1B, 20,
  /* 303 */  OCAML_RETURN, 1,
  /* 305 */  OCAML_CONSTINT_1B, 16,
  /* 307 */  OCAML_RETURN, 1,
  /* 309 */  OCAML_ACC0,
  /* 310 */  OCAML_BLEINT_1B, 50, 65,
  /* 313 */  OCAML_CONSTINT_1B, 21,
  /* 315 */  OCAML_RETURN, 1,
  /* 317 */  OCAML_ACC0,
  /* 318 */  OCAML_BGTINT_1B, 30, 11,
  /* 321 */  OCAML_ACC0,
  /* 322 */  OCAML_BLEINT_1B, 38, 61,
  /* 325 */  OCAML_CONSTINT_1B, 13,
  /* 327 */  OCAML_RETURN, 1,
  /* 329 */  OCAML_ACC0,
  /* 330 */  OCAML_BGTINT_1B, 22, 7,
  /* 333 */  OCAML_CONSTINT_1B, 11,
  /* 335 */  OCAML_RETURN, 1,
  /* 337 */  OCAML_ACC0,
  /* 338 */  OCAML_SWITCH_1B, 22, 0, 25, 25, 25, 25, 29, 25, 33, 33, 33, 33, 37, 37, 37, 37, 41, 41, 33, 33, 45, 45, 45, 45,
  /* 363 */  OCAML_CONSTINT_1B, 15,
  /* 365 */  OCAML_RETURN, 1,
  /* 367 */  OCAML_CONSTINT_1B, 17,
  /* 369 */  OCAML_RETURN, 1,
  /* 371 */  OCAML_CONSTINT_1B, 18,
  /* 373 */  OCAML_RETURN, 1,
  /* 375 */  OCAML_CONSTINT_1B, 12,
  /* 377 */  OCAML_RETURN, 1,
  /* 379 */  OCAML_CONSTINT_1B, 19,
  /* 381 */  OCAML_RETURN, 1,
  /* 383 */  OCAML_CONSTINT_1B, 14,
  /* 385 */  OCAML_RETURN, 1,
  /* 387 */  OCAML_ACC0,
  /* 388 */  OCAML_BGTINT_1B, 39, 31,
  /* 391 */  OCAML_ACC0,
  /* 392 */  OCAML_BGTINT_1B, 42, 75,
  /* 395 */  OCAML_ACC0,
  /* 396 */  OCAML_BGTINT_1B, 54, 15,
  /* 399 */  OCAML_ACC0,
  /* 400 */  OCAML_BGTINT_1B, 62, 7,
  /* 403 */  OCAML_CONSTINT_1B, 9,
  /* 405 */  OCAML_RETURN, 1,
  /* 407 */  OCAML_CONSTINT_1B, 5,
  /* 409 */  OCAML_RETURN, 1,
  /* 411 */  OCAML_ACC0,
  /* 412 */  OCAML_BLEINT_1B, 50, 63,
  /* 415 */  OCAML_CONSTINT_1B, 10,
  /* 417 */  OCAML_RETURN, 1,
  /* 419 */  OCAML_ACC0,
  /* 420 */  OCAML_BGTINT_1B, 30, 10,
  /* 423 */  OCAML_ACC0,
  /* 424 */  OCAML_BLEINT_1B, 38, 58,
  /* 427 */  OCAML_CONST2,
  /* 428 */  OCAML_RETURN, 1,
  /* 430 */  OCAML_ACC0,
  /* 431 */  OCAML_BGTINT_1B, 22, 6,
  /* 434 */  OCAML_CONST0,
  /* 435 */  OCAML_RETURN, 1,
  /* 437 */  OCAML_ACC0,
  /* 438 */  OCAML_SWITCH_1B, 22, 0, 25, 25, 25, 25, 29, 25, 33, 33, 33, 33, 37, 37, 37, 37, 40, 40, 33, 33, 44, 44, 44, 44,
  /* 463 */  OCAML_CONSTINT_1B, 4,
  /* 465 */  OCAML_RETURN, 1,
  /* 467 */  OCAML_CONSTINT_1B, 6,
  /* 469 */  OCAML_RETURN, 1,
  /* 471 */  OCAML_CONSTINT_1B, 7,
  /* 473 */  OCAML_RETURN, 1,
  /* 475 */  OCAML_CONST1,
  /* 476 */  OCAML_RETURN, 1,
  /* 478 */  OCAML_CONSTINT_1B, 8,
  /* 480 */  OCAML_RETURN, 1,
  /* 482 */  OCAML_CONST3,
  /* 483 */  OCAML_RETURN, 1,
  /* 485 */  OCAML_ACC0,
  /* 486 */  OCAML_BNEQ_1B, 1, 6,
  /* 489 */  OCAML_CONST1,
  /* 490 */  OCAML_RETURN, 1,
  /* 492 */  OCAML_CONST2,
  /* 493 */  OCAML_PUSHACC1,
  /* 494 */  OCAML_MODINT,
  /* 495 */  OCAML_BRANCHIF_1B, 8,
  /* 497 */  OCAML_CONST2,
  /* 498 */  OCAML_PUSHACC1,
  /* 499 */  OCAML_DIVINT,
  /* 500 */  OCAML_PUSHOFFSETCLOSURE0,
  /* 501 */  OCAML_APPTERM1, 2,
  /* 503 */  OCAML_ACC0,
  /* 504 */  OCAML_PUSHCONST3,
  /* 505 */  OCAML_MULINT,
  /* 506 */  OCAML_OFFSETINT_1B, 1,
  /* 508 */  OCAML_PUSHOFFSETCLOSURE0,
  /* 509 */  OCAML_APPTERM1, 2,
  /* 511 */  OCAML_CONST0,
  /* 512 */  OCAML_MAKEBLOCK1, 0,
  /* 514 */  OCAML_PUSHCONST1,
  /* 515 */  OCAML_PUSHCONSTINT_2B, 39, 16,
  /* 518 */  OCAML_PUSH,
  /* 519 */  OCAML_PUSHACC2,
  /* 520 */  OCAML_GTINT,
  /* 521 */  OCAML_BRANCHIF_1B, 21,
  /* 523 */  OCAML_CHECK_SIGNALS,
  /* 524 */  OCAML_CONSTINT_2B, 91, 233,
  /* 527 */  OCAML_PUSHGETRAMGLOBAL_1B, 0,
  /* 529 */  OCAML_APPLY1,
  /* 530 */  OCAML_PUSHACC3,
  /* 531 */  OCAML_SETFIELD0,
  /* 532 */  OCAML_ACC1,
  /* 533 */  OCAML_PUSH,
  /* 534 */  OCAML_OFFSETINT_1B, 1,
  /* 536 */  OCAML_ASSIGN, 2,
  /* 538 */  OCAML_ACC1,
  /* 539 */  OCAML_NEQ,
  /* 540 */  OCAML_BRANCHIF_1B, (opcode_t) -17,
  /* 542 */  OCAML_CONST0,
  /* 543 */  OCAML_POP, 2,
  /* 545 */  OCAML_ACC0,
  /* 546 */  OCAML_GETFIELD0,
  /* 547 */  OCAML_BNEQ_1B, 1, 10,
  /* 550 */  OCAML_CONST1,
  /* 551 */  OCAML_PUSHCONSTINT_1B, 9,
  /* 553 */  OCAML_PUSHGETFLASHGLOBAL_1B, 4,
  /* 555 */  OCAML_APPTERM2, 4,
  /* 557 */  OCAML_CONST1,
  /* 558 */  OCAML_PUSHCONSTINT_1B, 8,
  /* 560 */  OCAML_PUSHGETFLASHGLOBAL_1B, 4,
  /* 562 */  OCAML_APPTERM2, 4,
  /* 564 */  OCAML_APPLY2,
  /* 565 */  OCAML_CONST1,
  /* 566 */  OCAML_PUSHCONSTINT_1B, 10,
  /* 568 */  OCAML_PUSHGETFLASHGLOBAL_1B, 5,
  /* 570 */  OCAML_APPLY2,
  /* 571 */  OCAML_CONST1,
  /* 572 */  OCAML_PUSHCONSTINT_1B, 9,
  /* 574 */  OCAML_PUSHGETFLASHGLOBAL_1B, 5,
  /* 576 */  OCAML_APPLY2,
  /* 577 */  OCAML_CONST1,
  /* 578 */  OCAML_PUSHCONSTINT_1B, 8,
  /* 580 */  OCAML_PUSHGETFLASHGLOBAL_1B, 5,
  /* 582 */  OCAML_APPLY2,
  /* 583 */  OCAML_CLOSUREREC_1B, 1, 0, (opcode_t) -98,
  /* 587 */  OCAML_ACC0,
  /* 588 */  OCAML_SETRAMGLOBAL_1B, 0,
  /* 590 */  OCAML_CLOSURE_1B, 0, (opcode_t) -79,
  /* 593 */  OCAML_PUSHCONSTINT_2B, 7, 208,
  /* 596 */  OCAML_C_CALL1, 2,
  /* 598 */  OCAML_CONST1,
  /* 599 */  OCAML_PUSHCONSTINT_1B, 11,
  /* 601 */  OCAML_PUSHGETFLASHGLOBAL_1B, 4,
  /* 603 */  OCAML_APPLY2,
  /* 604 */  OCAML_CONST0,
  /* 605 */  OCAML_PUSHACC1,
  /* 606 */  OCAML_APPLY1,
  /* 607 */  OCAML_CONST1,
  /* 608 */  OCAML_PUSHCONSTINT_1B, 10,
  /* 610 */  OCAML_PUSHGETFLASHGLOBAL_1B, 4,
  /* 612 */  OCAML_APPLY2,
  /* 613 */  OCAML_POP, 2,
  /* 615 */  OCAML_STOP
};

#include </home/adilla/Documents/VmMic/Tools/OMicroB/src/byterun/vm/runtime.c>

PROGMEM void * const ocaml_primitives[OCAML_PRIMITIVE_NUMBER] = {
  /*  0 */  (void *) &caml_avr_set_bit,
  /*  1 */  (void *) &caml_avr_clear_bit,
  /*  2 */  (void *) &caml_avr_delay,
};
