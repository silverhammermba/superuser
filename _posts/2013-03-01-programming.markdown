---
layout: chapter
title: Programming
category: part3
---

We know that when you type a command like `ls foo` the shell is actually telling
the kernel to run the program `/usr/bin/ls` with the argument `foo`. But we
still don't really see what goes on behind the scenes when that program runs.
Conceptually, we know that a program is a list of instructions for the computer,
but the only real experience we have of that was the instructions for our
simple, theoretical Turing machine. In this chapter we'll look at some real
program instructions and take a glimpse at how real-world programs are made.

## Machine Code ##

At the lowest, most fundamental level we have so-called machine code. Machine
code is the true instructions understood by the CPU. The CPU reads instructions
as just pure binary data sent along electrical circuits as little electrical
pulses representing the ones and zeros. We are going to create a very simple
program in machine code.

First you need to understand that while the kernel could technically run any
sort of program on the computer, it expects certain standard behavior from most
programs. For example, it expects that when a program is done running, the
program will send it a number indicating how things went. This number is called
the program's "exit code". It doesn't really matter what the number is: like
command arguments, the meaning of the exit code can vary from program to
program. But in fact most programs handle it very simply: an exit code of 0
means everything went alright and an exit code of 1 means something went wrong
while the program was running.

The program we're going to make is very simple: it will send the kernel the exit
code "7". That's all. To write this program in machine code, we need to be able
to write some binary data. We will do this using a tool called `hexedit` which
lets us edit files by changing the hexadecimal values of each byte.

First we need to create a file to store the program instructions. We will do
this using a command called `dd` which lets us create a file with a certain
number of bytes.

    # dd if=/dev/zero of=sevn bs=1 count=91

This creates the 91 byte file `sevn` by copying the contents of the file
`/dev/zero`, which is a special file containing just zero bytes. Now we can edit
the bytes of this file:

    # hexedit sevn

And you will see a screen like this:

    00000000   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000010   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000020   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000030   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000040   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000050   00 00 00 00  00 00 00 00  00 00 00                   ...........

The `hexedit` interface is split up into three columns. The column on the left
simply shows us byte numbers in hexadecimal to keep track of where we are the in
the file. So the first byte of the first line is byte `0x0`, the first byte of
the second line is byte `0x10`, the first byte of the third line is `0x20`, etc.
The middle column is the actual bytes of the file in hexadecimal. Remember that
in hexadecimal a byte stores values from `0x0` to `0xFF`, so each byte is
represented here by two characters. The spacing in between the bytes helps us
visualize them in groups of 4 or 8. There are 16 bytes on each line. The third
column is also the bytes of the file but displayed as ASCII characters. If a
byte value doesn't have a printable ASCII character (such as a number or
letter), it just prints a `.`.

Start typing on the first line so that the first four bytes look like this:

    7F 45 4C 46

You can use backspace to undo and the arrow keys to move the cursor as you might
expect. You also don't need to hold <kbd>Shift</kbd> to enter hexadecimal
letters even though everything is written in upper case.
{: .note}

Notice that the corresponding bytes in the third column change because `45 4C
46` are the hexadecimal values for "ELF" in ASCII.

<div class="exercise">
Keep changing bytes until your columns look like this:

    00000000   7F 45 4C 46  01 01 01 00  00 00 00 00  00 00 00 00   .ELF............
    00000010   02 00 03 00  01 00 00 00  54 80 04 08  34 00 00 00   ........T...4...
    00000020   00 00 00 00  00 00 00 00  34 00 20 00  01 00 00 00   ........4. .....
    00000030   00 00 00 00  01 00 00 00  00 00 00 00  00 80 04 08   ................
    00000040   00 80 04 08  5B 00 00 00  5B 00 00 00  05 00 00 00   ....[...[.......
    00000050   00 10 00 00  B3 07 31 C0  40 CD 80                   ......1.@..

Once you've finished, press <kbd>Ctrl</kbd>+<kbd>X</kbd> to save the file and
then press <kbd>Y</kbd> to confirm and exit `hexedit`.
</div>

Now I realize that it was really tedious to type in all of those bytes and you
might have made a typo or misread something. So let's check our work. For this
we can use the command `md5sum`, which prints a checksum of the bytes in our
file!

    # md5sum sevn
    21deab879a3943cb640e7bfc9b702ca2  sevn

If the output you get doesn't match that, you probably mistyped something. Open
the file again in `hexedit` and carefully look things over and edit until you
get the checksum to match. Once you have a match, we're almost ready to go. Next
we have to tell the file system that this file is actually a program, not just a
bunch of bytes:

    # chmod +x sevn

This **ch**anges the **mod**e of the file to e**x**ecutable. "Executable" is yet
another synonym for program. Now we can run the program:

    # ./sevn

Remember that when we type the name of a program as a shell command, the shell
looks for the program in certain directories like `/usr/bin`. Since we
(probably) didn't create our `sevn` program in one of these directories, we have
to specify exactly where the program is by including the `./`.
{: .note}

If everything went according to plan, your shell will simply print another
prompt. That's because the shell normally doesn't display the exit code of the
program it runs and our program doesn't have any instruction to print anything.
To check that the program actually worked, we can run another command which
prints the exit code of the previous command:

    # echo $?
    7

Ta da! That 7 means our program worked!
