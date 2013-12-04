---
layout: chapter
title: Simple Machines
---

Now we know what a computation is, but how is that related to the computers we
know today?

To answer this question, we're going to go way back to the beginning and talk
about the very first computers: people. People have been carrying out
computation for quite some time, especially for business purposes. The faster
and more accurately you can compute, the more products you can sell, the more
accurately you can track your finances, the further you can plan for the future,
etc.

Humans are decent at computation (almost all of pre-college math is
computation), but they come with some significant drawbacks. The main problem is
that computation is very boring. Since computation relies on algorithms -
instructions with no room for interpretation - it can be very uncreative, dull
work. Dull work causes people to zone out; zoning out causes people to make
silly mistakes. Secondly, humans don't have very good memories for computation.
We can remember lots and lots of things, but our memory is fuzzy and selective:
not so good at remembering huge quantities of precise numbers. That means that
large computations require a lot of book-keeping to bypass our limited memory.
Lastly humans aren't terribly fast at computation. For big companies with lots
of accounting requirements, humans are not a great solution.

Various computational tools have been invented over the years to assist humans
with computation - such as the abacus and slide rule - but these essentially
amount to fancy book-keeping methods and still require slow, fallible human
effort.

The next big breakthrough in computation came with computing machines. This was
a crucial stepping stone to modern computers, so we're going to relive it right
now by inventing a machine that can add two numbers with much less chance of
human fallibity mucking it up. We're going to work our way up to this machine by
making much simpler machines first.

![Add 1 Machine]({{ site.baseurl }}/images/add1.png)

We'll start with a wheel attached to the surface of a table. Around this wheel
we'll evenly write the digits 0-9. We can attach a handle to rotate the wheel
and draw a mark on the table to point at the wheel. Tada! We now have a very
simple computing machine! In particular, this is an "add 1 to a number" machine.
It takes as input a single digit number and outputs a single digit number. The
algorithm it uses is as follows:

1. Turn the wheel so that the mark points at the input digit
2. Turn the wheel so that the mark points at the next biggest digit
3. The digit pointed to by the mark is the output

![Overflow]({{ site.baseurl }}/images/overflow.png)

This machine is a bit silly, but it does do the job... kinda. What happens if
we give it 9 as input? Argh! The wheel circles back around to 0!

![Carrying Digits]({{ site.baseurl }}/images/carry.png)

We can solve this problem by adding another wheel to our contraption. The
second wheel is exactly like the first, except rather than turning it directly
with a handle we attach it to the first wheel. The attachment should be
designed such that the second wheel remains stationary. Except when the first
wheel turns from 9 back to 0, then the second wheel advances by one digit (the
diagram shows a crude example of this, but if you want to see how this is done
for real check out this [video][yt]). Now when we give an input of 09, turning
the handle changes the 9 to 0, which advances the 0 to 1 and we get 10!
Success!  If we keep turning, the second wheel remains at 1 (giving us 11, 12,
13, ...) until we get to 19 and it once again advances us to 20.

[yt]: http://www.youtube.com/watch?v=rjWfIiaOFR4

By now you might realize that we still have a problem. Our new machine works
all the way up to 99 and then the same error occurs. Turning the rightmost 9
back to 0 advances the leftmost 9 to 0 as well, so our machine says that 99+1=0.
Dang! We can keep adding more wheels like we did before but that only delays the
error. How do we solve it? Well... we don't. Without having infinitely many
wheels, there's nothing we can do other than ensure that we have enough wheels
at the moment to handle the input we have. You might be surprised to know that -
as simple as our little machine is - it shares this problem with every modern
computer. It's such a common problem that computer scientists even have a
special term for it: "overflow". As is common in computer science, from now on
we'll just assume that we have lots and lots of wheels - not inifinitely many,
but enough that we can handle reasonably large numbers without overflowing.

<aside class="deeper">
It's tempting to think of overflow as a problem like I just did. But there's
another way to look at it. What if we thought of our machine as taking your
input and output, dividing them by 100 and then only showing you the remainder?
99 + 1 = 100 = 100 &times; 1 + 0 so the machine tells you zero! Do a few examples and you'll see
that this always works: 100 + 1 = 101 = 100 &times; 1 + 1 and so on. This trick is called
"modular arithmetic". It works just like normal arithmetic except that numbers
always stay smaller than the "modulus" (which is 100, in this case).
</aside>

If we use the right sort of mechanism to connect the wheels (as I did in the
diagram), we get a bonus feature from the machine: turning the rightmost wheel
backwards one digit from 0 to 9 turns the wheel to its left backwards by one
digit (the reverse of what the wheels did before). Now we have an "add or
subtract 1 from a number" machine! By turning the handle in the opposite
direction, it counts in the opposite direction from what it did before. As you
might expect, this machine now has an "underflow" problem: if we subtract 1 from
0, the rightmost 0 turns to a 9, which turns the wheel to its left from 0 to 9,
which turns the wheel to its left from 0 to 9, which... ends up with 9999...9
(the largest number we can have with the wheels in our machine). Again, this
problem is unavoidable.

We are now ready to construct our number adding machine. To construct it, we
take *two* of our add/subtract 1 machines and connect them such that the two
wheels with handles turn each other in opposite directions. Now when we add 1
on one machine, it subtracts 1 on the other machine and vice versa. Operating
this machine is quite simple:

1. manually turn the wheels of each machine to display the two input numbers
2. turn the handle until one of the machines is all zeroes
3. the other machine now shows the sum

This machine solves a lot of the problems with human computation. Short of
inputting the numbers incorrectly or misreading the output, it's virtually
impossible to make a computational error. It can compute as quickly as the
operator can turn the handle (if it is well built). It does solve the problem of
humans' limited memory, however it exchanges it for its own memory problem: the
over/underflowing we noticed earlier. This isn't as bad though: we're limited by
the machine's memory (number of wheels), but we know exactly what that
limit is, so we know which numbers it isn't able to handle.

We do have some new problems though. Building a physical machine out of gears
and levers is no simple task, especially since a high degree of precision is
required for good operation. With use this machine would slowly deteriote and
need to be serviced and supplied with replacement parts. Also while humans can
be taught and trained to perform any kind of computation, this machine had to be
specially designed to perform our one, specific kind of computation. If you
wanted to build a machine that multiplied numbers or one that performs
exponents, you would need to design and manufacture a whole new machine from
scratch. Ugh. Still, for a while these sorts of machines were quite widely used.
The German [Enigma encryption machine][wp] used in World War II is a
particularly famous machine of this class. The Enigma used electricity to power
lightbulbs, but otherwise functioned similarly to our wheel-based adding
machine.

[wp]: http://en.wikipedia.org/wiki/Enigma_machine

Computers
=========

The capability to break the Enigma code was thanks in part to a brilliant
English mathematician who had dreamed up a new sort of computing machine. He
wondered if you could build a computing machine *that computes computing
machines*: a machine where the input would not only be numbers, but the type of
computation to perform as well. That is, by changing part of the input you could
have the machine perform a completely different computation on the same numbers.
Such a machine would solve the biggest problem with previous computing machines:
the need to design and manufacture a new machine for each type of computation.
Such a machine would - in a sense - be the last computing machine you would ever
need; it could be adapted to solve any computable problem simply by changing its
input.

The machine he created, and which now bears his name, is the Turing machine:
the first true computer. In order to create the mother-of-all computing
machines, Turing distilled computation to its bare essentials. The machine
consists of the following components:

![Turing machine]({{ site.baseurl }}/images/turing.png)

1. A **tape**, on which we can write a sequence of digits. As with
   the number of wheels on our adding machine, we assume that the tape is very
   long - long enough for whatever computation we are performing. We assume
   that the tape starts with every position in the sequence set to 0
2. A **head** which can read and write digits on the tape - but
   only one digit at a time! The head can move along the tape to go from one
   digit to the previous or next, but again only one digit at a time.
3. A **state register**, which we can think of like a wheel in our
   adding machine. The wheel has numbers around the edge and a mark pointing at
   a single number. Whatever number is currently pointed to, we call the
   "current state" of the Turing machine. Similar to the tape, we don't care
   how many numbers are around the edge of the wheel. It just needs to be
   enough to perform the computation we're doing. We assume that the machine
   starts in state 0.
4. A list of **instructions** for the head to follow. However,
   every single instruction must be a rule of the form:

    1. Depending on the current tape digit and the current state,
    2. Write a digit to the tape (it could be the same one we just read),
	3. Move the head either one symbol to the left, one symbol to the right, or
	   not at all,
	4. And choose the next state of the machine (again, this could be the same
	   state it was already in)

Let's compare this to the mechanical adding machine we recently built. The tape
is a lot like the series of wheels. Each wheel pointed to a single digit, just
as each position on the tape can have a single digit on it. The head is kind of
like you, looking at the wheels and turning the crank until the computation is
complete. The list of instructions is an algorithm just like the instructions
for operating the adding machine. The big difference is that these instructions
must all be the same format: read a digit, write a digit, move, change state.
Noticeably absent from our old adding machine is the state register. We'll see
how that works in a moment.

To show you how a Turing machine can replicate any other computation machine,
we'll recreate our amazing "add 1 to a number" machine with a Turing machine.

First we'll give the machine input: we take our tape of all zeros, erase a few
of them, and write our number in their place. We can write our number such that
the rightmost digit is under the head of the machine. For this computation, we
will only need two states, so our Turing machine should have a state register
with at least states 0 and 1 on it.

Now we need to give it a list of instructions. Remember that all Turing machine
instructions look something like, "If the current state is 1 and you read a 0,
write a 3, move to the left, and change the current state to 2." Another
instruction might be, "If the current state is 1 and you read a 1, write a 0,
don't move, and change the current state to 10." Notice that of all those words,
instructions can only differ in a few ways. To keep things brief we'll write
instructions in shorthand:

    (current state, digit that was read, digit to write, direction to move [L/R/N], next state)

In our shorthand those last two instructions would look like this:

    (1, 0, 3, L,  2)
    (1, 1, 0, N, 10)

Back to the add 1 machine, here is our list of instructions:

    (0, 0, 1, N, 1)
    (0, 1, 2, N, 1)
    (0, 2, 3, N, 1)
    (0, 3, 4, N, 1)
    ...
    (0, 7, 8, N, 1)
    (0, 8, 9, N, 1)
    (0, 9, 0, L, 0)

Now we can imagine how our Turing machine will operate. Suppose we give it 4 as
input:

1. The machine starts in state 0 and reads a 4. This matches the rule
   (0, 4, 5, N, 1) so it writes a 5, doesn't move the head, and changes to state
   1.
2. The machine is in state 1 and reads a 5. There are no rules that start with
   (1, 5, ...) so the machine stops.

Lo and behold there is now a 5 on the tape! Amazing! Okay, maybe not that
amazing. Perhaps an input of 299 will be more mind-blowing:

1. The machine starts in state 0 and reads a 9. This matches the rule
   (0, 9, 0, L, 0) so it writes a 0, moves the head to the left one, and changes
   to state 0.
2. The machine is in state 0 and reads a 9. This matches the same rule as
   before, so it writes a 0, moves the head to the left one, and changes to
   state 0.
3. The machine is in state 0 and reads a 2. This matches the rule
   (0, 2, 3, N, 1), so it writes a 3, doesn't move the head, and changes to
   state 1.
4. The machine is in state 1 and reads a 3. There are no rules starting with
   (1, 3, ...) so the machine stops.

Bam! Our Turing machine wrote 300 on that imaginary tape like a BOSS.

Have you figured out the purpose of the state register yet? It comes from how
addition works with single digit numbers. In most cases, when you add 1 to a
single digit number you just change it to the next single digit number and
you're done. The exception is when you add 1 to 9, then you change it to a 0 and
have to add 1 to the next digit as well. So you can think of state 0 in the
register as being the "add 1 to this digit" state. Look back at the list of
instructions; every rule starting with (0, ...) says how to change that digit
when 1 is added to it. The 1 state is our "finished" state. No rule starts with
(1, ...) so when we change to that state the machine will stop. Every
instruction transitions to the finished state except for the rule (0, 9, ...)
because then we need to keep adding. Cool, right?

The state register is one piece of the magic of Turing machines. Even though it's
just a bunch of numbers, the way we use those states in our instructions gives
them special meaning. You could write different Turing machine instructions also
using states 0 and 1, but with completely different meanings than they had in
our last example.

<aside class="definition">
An algorithm that is read and performed by a computer is called a **program**.
**Programming** is the process of inputting the algorithm into the computer for
it to read.
</aside>

In the vernacular of superusers, you could call the list of instructions an "Add
1 to a number _program_".

<aside class="exercises">
<ol>
<li>
Create a list of Turing machine instructions (i.e. a program) for subtracting
one from a number.  Test your instructions using 4 as input and again using 100.
Now try subtracting 1 from 0. What will happen? Think about different ways you
might avoid this problem.
</li>
<li>
The Turing machine I described uses digits and numbers for the tape and state
register but these were actually an arbitrary choice. What if we upgrade our
Turing machine to read and write letters in addition to digits? Can this help
solve the problem in the Exercise 1?
</li>
<li>
The add 1 program is really repetitive. Try to think of a way to change the
program and input we give the machine so that we don't end up with 9 versions of
basically the same instruction.
</li>
</ol>
</aside>
