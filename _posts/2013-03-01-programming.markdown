---
layout: chapter
title: Programming
category: part3
---

We know that when you type a command like `ls foo` the shell is actually telling
the kernel to run the program `/usr/bin/ls` with the argument `foo`. But we
still don't really see what goes on behind the scenes when that program runs.
Conceptually, we know that a program is a list of instructions for the computer,
but so far the only example we've seen of that was the instructions for the
simple, theoretical Turing machine back in [Part 1][tur]. In this chapter we'll
look at some _real_ program instructions.

[tur]: {{ site.baseurl }}/part1/machines/#computers

## Machine Code ##

At the lowest, most fundamental level we have so-called machine code. Machine
code is the basic instructions understood by the CPU. The CPU reads instructions
byte-by-byte as pure digital data. We are going to create a very simple program
in machine code by creating a file containing such data.

First you need to understand that while the kernel could technically run any
sort of program on the computer, it expects certain standard behavior from most
programs. For example, it expects that when a program is done running, the
program will send it a number indicating how things went. This number is called
the program's "exit code". It doesn't really matter what the number is: like
command arguments, the meaning of the exit code can vary from program to
program. Most programs use very simple exit codes: an exit code of 0 means
everything went alright and an exit code of 1 means something went wrong while
the program was running.

The program we're going to make is very simple: it will send the kernel the exit
code "7". Nothing more. To write this program in machine code, we need to be
able to write some specific bytes to a file. We will do this using a tool called
`hexedit` which lets us edit files by changing the hexadecimal values of each
byte.

First we need to create a file to store the program instructions. We will do
this using a command called `dd` which lets us create a file with a certain
number of bytes. We will do all of the work in this chapter in the `/root`
directory.

    # cd /root
    # dd if=/dev/zero of=sevn bs=1 count=91

This creates the 91 byte file `sevn` by copying the first 91 bytes of the file
`/dev/zero`, which is a special file containing just zero bytes. Now we can edit
the bytes of this file:

    # hexedit sevn

You will see a screen like this:

    00000000   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000010   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000020   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000030   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000040   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00   ................
    00000050   00 00 00 00  00 00 00 00  00 00 00                   ...........

The `hexedit` interface is split up into three columns. The column on the left
simply shows us byte numbers in hexadecimal to keep track of where we are in the
the file. So the first byte of the first line is byte number 0x0, the first byte
of the second line is byte number 0x10, the first byte of the third line is
number 0x20, etc. The middle column shows the actual bytes of the file in
hexadecimal, which are all zero. In hexadecimal a byte stores values from 0x00
to 0xFF, so each byte is represented by two characters. Each line has 16 bytes
and the spacing in between the bytes helps us visualize them in groups of 4. The
right column is a duplicate of the middle column but it shows the bytes of the
file represented as [ASCII] characters rather than hexadecimal values. Since
only the byte values 0x20&ndash;0x7E correspond to ASCII characters, all other
byte values are displayed as a `.` in this column.

[ASCII]: {{ site.baseurl }}/part2/http/#text

Start typing on the first line so that the first four bytes look like this:

    7F 45 4C 46

You can use backspace to undo and the arrow keys to move the cursor as you might
expect. Even though everything appears in uppercase, you don't need to hold
<kbd>Shift</kbd> when you type.
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

I realize that it was really tedious to type in all of those bytes and you might
have made a typo or misread something. So let's check our work. For this we can
use the command `md5sum`, which prints a [checksum][cs] of the bytes in our
file:

    # md5sum sevn
    21deab879a3943cb640e7bfc9b702ca2  sevn

[cs]: {{ site.baseurl }}/part2/intro/#checksums

If the output you get doesn't match that, you mistyped something. Open the file
again in `hexedit` and carefully look things over and edit until you get the
checksum to match. Once you have a match, we're almost ready to go. Next we have
to tell the file system that this file is actually a program, not just a bunch
of bytes:

    # chmod +x sevn

This **ch**anges the **mod**e of the file to e**x**ecutable. "Executable" is yet
another synonym for program. Now we can run the program:

    # ./sevn

Remember that when we type the name of a program as a shell command, the shell
looks for the program in certain directories like `/usr/bin`. Since we didn't
create our `sevn` program in one of these directories, we have to specify
exactly where the program is by including the `./`.
{: .note}

If everything went according to plan, your shell will simply print another
prompt, meaning it finished running the program and is waiting for another
command. To know that our program worked as we intended, we need to see what its
exit code was. When you run a command, the shell stores its exit code for later
use. You can tell the shell to show you that exit code with the following
command:

    # echo $?
    7

Tada! That 7 means our program worked. Now that we have a working program, let's
take a look at what it's doing. Just like most other files, programs store their
data (their instructions) in a format. So not all of the bytes we just wrote are
actual program instructions; many of them describe things like what kind of
program this is, what sort of computers it works on, etc. We don't really care
about that stuff so we can just focus on the last seven bytes, which are the
actual instructions:

    B3 07 31 C0 40 CD 80

The CPU basically performs these instructions from left to right byte-by-byte.
Some instructions are kind of like shell commands and have arguments, so they
include multiple bytes. We can visually split up the instructions like so:

    B3 07
    31 C0
    40
    CD 80

So there are four instructions. Let's talk about what they do.

 1. Recall from the hardware chapter that the CPU's memory is its
    [registers][cpu]: numbers with a set size that we can perform calculations
    on. The first instruction `B3 07` stores the byte value `07` in a 8-bit
    register called BL. This is the exit code that we're going to send to the
    kernel.
 2. The next instruction `31 C0` sets a different register to 0. The `C0` is
    what chooses which register gets zeroed. In this case it's a 32-bit register
    named EAX.
 3. Next we get the single instruction `40`. This simply adds 1 to the value in
    the EAX register. Since we previously set this register to 0, the EAX
    register now has the value 1.
 4. Finally we get the `CD 80` instruction. The machine code `CD` is called an
    "interrupt". It means we are interrupting our program to hand control over
    to some other part of the computer. The second byte specifies what that
    "something else" is. `80` specifies that this is an interrupt for a "system
    call", which is another way of saying that we want to hand control over to
    the kernel. So when the processor sees the interrupt instruction it
    transfers control to the kernel, at which point the kernel looks at the
    values that we have placed in the CPU's registers. These values work kind of
    like a shell command: the value in EAX tells the kernel what sort of action
    to perform and the value in BL is an argument for that action. A value of 1
    in EAX is an "exit" action, and the value in BL says that the exit code
    should be 7.

[cpu]: {{ site.baseurl }}/part1/hardware/#central-processing-unit

So to recap, we store the exit code in BL, set EAX to 1 (which is the code for
an exit), and give control to the kernel to perform the exit with the specified
exit code.

So that was more than a little confusing and difficult. But this is hopefully
the last time you'll ever need to touch machine code; only crazy people actually
write machine code by hand like we just did. I just wanted to demonstrate that
you can type out instructions as bytes and make the computer do things.

Modify the `sevn` program to have a different exit code.
{: .exercise}

## Assembly ##

In practice, the closest that programmers get to writing machine code is a
slightly more readable style called "assembly". Writing machine code is
difficult because you have to keep in mind all of the technical details of the
computer and the way its registers and instructions interact, but it also has an
additional layer of difficulty because every instruction is a bunch of
meaningless bytes. How do you remember that `31 C0` means "set EAX to 0"? That's
just not easy to understand.

Assembly improves this one aspect of machine code by letting us write (slightly)
more human-readable instructions. For example, `40` in machine code becomes
`incl %eax` in assembly. `incl` is short for **inc**rement **l**ong and the `%`
indicates that `eax` is the name of the register we want to increment. It's
still not super understandable, and you still need to have a good understanding
of the inner workings of the CPU, but it's definitely easier to work with. Let's
rewrite our program in assembly.

Unlike machine code which is pure digital data (usually viewed as hexadecimal),
assembly is entirely human-readable ASCII text. So instead of `hexedit` we will
use a program called `nano`, which is a text editor. Type

    # nano sevn.s

This opens up a new text file called `sevn.s` in a simple text editing
interface, somewhat similar to `hexedit`. You can type to add text and use
backspace and the arrow keys as you would expect.

<div class="exercise">
Type out the following text:

{% highlight asm %}
.global _start
.text
_start:
movb $7,%bl
xorl %eax,%eax
incl %eax
int $0x80
{% endhighlight %}

As in previous chapters the text is colored simply to make it easier to read.
{: .note}

Then press <kbd>Ctrl</kbd>+<kbd>O</kbd> and <kbd>Enter</kbd> to save the text in
the file `sevn.s`.
</div>

Now let's look at what this assembly says. Like the machine code, we can ignore
the beginning because it's just part of the assembly format. The last four lines
are the actual instructions and they correspond to the four instructions we saw
earlier:

 1. `B3 07` has become `movb $7,%bl`, which means "**mov**e the **b**yte 7 into
    register BL". The `$` indicates that `7` is a literal, numerical value. The
    `%` indicates that `bl` is the name of a register. In other words, set BL to 7.
    Assembly language may not be "human readable" per se, but at least we can
    see the names of the registers in the instructions now.
 2. `31 C0` has become `xorl %eax,%eax`. Oddly, assembly doesn't have an
    instruction for setting a register to 0. But we can achieve the same effect
    by [XOR]ing a register with itself. So `xorl %eax,%eax` says "**XOR** EAX
    with the **l**ong value in EAX". In assembly language, "long" means 32-bits.
    So this instruction sets all 32 bits of EAX to 0.
 3. As we mentioned earlier, `40` becomes `incl %eax` which means "increment the
    32-bit register EAX by 1". So now EAX contains a 1.
 4. And finally `CD 80` becomes `int $0x80` which is of course short for
    "**int**errupt code 0x80" i.e. a system call. So we see that even though
    this program is written differently it performs the exact same steps as our
    machine code program.

[XOR]: {{ site.baseurl }}/part2/security/#going-binary

Once you're done perusing your assembly code, press <kbd>Ctrl</kbd>+<kbd>X</kbd>
to exit `nano`. If you want to check your work again:

    # md5sum sevn.s
    bedeba8cdfade20ece6a3e37da749435  sevn.s

Getting your assembly to run is a little more involved than it was for your
machine code. You see, the CPU _only_ understands machine code, so we need to
translate our assembly back into machine code before we can run it. This is a
two stage process. First we turn our assembly into an "object file" using the
`as` command (short for **as**semble):

    # as -o sevn.o sevn.s

The `-o` option tells `as` to save the object file with the file name `sevn.o`.
Next we use the `ld` command (short for **l**ink e**d**itor) to "link" the
object file and create the executable:

    # ld -s -o sevn2 sevn.o

Again, the `-o` option tells `ld` to save the executable file with the file name
`sevn2` (so you can compare it with the machine code version of the program).
The `-s` is optional, but it makes the resulting machine code a little easier to
read. `ld` is even nice enough to mark the file as executable for us, so we
don't have to `chmod` it like we did before. So now:

    # ./sevn2
    # echo $?
    7

Success!

<div class="deeper">
The reason why this is a two stage process is actually to save us time when we
make really big, complicated programs. Suppose we're working on a team to make a
program and we want different team members to work on different parts of the
program. We could all work on our assembly code separately, then put our code
together in one big assembly file, and create the executable. But the big
downside of this is that if later on we want to change even one instruction, we
have to re-assemble the _whole_ program!

What we can do instead is write our assembly separately _and_ translate our
assembly into machine code separately. The resulting pieces of machine code
aren't programs themselves, so instead we call them "object files". Then we use
another program, the link editor, to "link" our object files together into an
actual program. That way if we want to change an instruction later, we only have
to re-assemble that one piece and then re-link the pieces rather than
re-assemble _everything_.
</div>

Open up `sevn2` in `hexedit`. There are a lot more bytes than before but again
most of it is formatting. That's because `as` and `ld` included more optional
parts of the executable format that we left out when we wrote the machine code
by hand. However the same familiar machine code instructions should be nestled
in here somewhere. See if you can find them.
{: .exercise}

While some programmers still write assembly today, it has many drawbacks. First
of all the instructions are processor-specific. So a program written in assembly
will only work with certain CPUs. If you want to run your program on other
computers with different CPUs, you need to rewrite it in instructions that that
computer understands. Second, while it is more human readable than machine code,
assembly is still not very understandable and thus it can be notoriously
difficult to write it without making mistakes. Third, assembly can be very
tedious to write. Seemingly simple tasks can often take a surprising number of
instructions to perform. In the next chapter we'll learn about more advanced
programming techniques that solve these problems.

## Exercises ##

<div class="exercise">
1. Try changing a _single_ byte of the `sevn` file so that this happens

       # ./sevn
       -bash: ./sevn: cannot execute binary file: Exec format error

   What do you think that means?
2. Try changing a _single_ instruction of `sevn.s` so that when you reassemble
   and run it this happens

       # ./sevn2
       Segmentation fault (core dumped)

   What do you think that means?
</div>
