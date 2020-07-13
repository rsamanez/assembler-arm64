
/*  
Program to be test on a raspberry4 with linux os
   as --version
        GNU assembler (GNU Binutils for Ubuntu) 2.34
        Copyright (C) 2020 Free Software Foundation, Inc.
        This program is free software; you may redistribute it under the terms of
        the GNU General Public License version 3 or later.
        This program has absolutely no warranty.
        This assembler was configured for a target of `aarch64-linux-gnu'.

    * Prints "Hello World\n" and returns 0.
    hello.asm
         Compile:
            as -o hello.o hello.asm  [ -a=hello.list ]
            gcc -o hello hello.o
         Run:
            ./hello
    hello.s
         Compile:
             gcc -o hello hello.s
*/
    .section .rodata // Read-only data section
mesg: .asciz "Hello World\n" // Define null-terminated string
    .text // Text section
    .global main
main: 
    stp x29, x30, [sp, #-16]!
    // printf("Hello World\n")
    adr x0, mesg
    bl printf

     // return 0
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main,(. - main)
