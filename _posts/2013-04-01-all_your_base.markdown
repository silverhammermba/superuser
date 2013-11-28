---
layout: chapter
title: All Your Base
---

You have now constructed (in your mind) a true, modern computer! Given enough
tape, a big enough state register, and the right program, you can perform any
computation! There's still a big gap between the simple, theoretical Turing
machine and the complicated computers we use in real life but you'll be happy to
know that we'll be skipping over most of the details of that topic.

We're getting _sooo_ close to talking about real life computers. I promise!
There's just a couple more topics which we must cover before we're ready to talk
about real computers. First up:

Binary
======

The machines we learned about previously counted the way we're used to: 0,
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, ... and you get the idea. The wheels we
used had 10 digits on them and we wrote rules for our Turing machine to handle
the digits 0 through 9. That was convenient for us humans to read but it made
the design of the machines rather complicated. The wheels needed to be very
large, and we needed to write lots of repetitive rules for the Turing machine.
Is there a simpler way?

First let's think about how we count normally. We use single digits up to 9, but
then for ten we don't have a single digit. So instead the 9 becomes a 0 and we
put a 1 to its left. Then we can continue counting normally until we get to 19
and once again the 9 becomes a 0 and the digit to the left changes. It's just
like how our adding machine worked. So now imagine that we *don't* have the
digits 0 through 9. What if we only have 0 through 4? Let's count:

    0, 1, 2, 3, 4, ...

Well just like before, we don't have a digit for 5. So let's make the 4 into a 0
and put a 1 to its left:

    0, 1, 2, 3, 4, 10, 11, 12, 13, 14, ...

And we've run out of digits again so:

    0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 30, 31, 32, 33, ...

But what do these numbers mean? Let's count "normally" alongside:

    0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 30, 31, 32, 33, ...
    0, 1, 2, 3, 4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, ...

Now we can see that "10" with this new counting system means five, "21" means
eleven, and so on. Ugh, this is getting really confusing. We need names for this
stuff. In mathematics, these different ways of counting are called different
*bases*. When we use 0 through 9, we have ten digits so that's "base 10" A.K.A.
"decimal". 0 through 4 is five digits so that would be "base 5". To avoid confusion
you can put the base next to the number so that it's clear what you mean. For
example:

14<sub>5</sub> = 9<sub>10</sub>

30<sub>5</sub> = 15<sub>10</sub>

3<sub>5</sub> = 3<sub>10</sub>

Most humans tend to think in base 10, so it's useful to be able to convert
numbers in different bases to base 10. Here's how you convert base 10 to base
10:

1324<sub>10</sub> = 1 &times; (10<sup>3</sup>) + 3 &times; (10<sup>2</sup>) + 2 &times; (10<sup>1</sup>) + 4 &times; (10<sup>0</sup>) = 1000<sub>10</sub> + 300<sub>10</sub> + 20<sub>10</sub> + 4<sub>10</sub> = 1324<sub>10</sub>

Don't get freaked out by the notation! Think about how you say "1324": one
thousand three hundred and twenty four. Or to make a slight modification: one
thousand, three hundreds, two tens, and four ones; this is exactly what the
formula is doing! Converting from base 5 is similar except now all of the tens
becomes fives:

1324<sub>5</sub> = 1 &times; (5<sup>3</sup>) + 3 &times; (5<sup>2</sup>) + 2 &times; (5<sup>1</sup>) + 4 &times; (5<sup>0</sup>) = 125<sub>10</sub> + 75<sub>10</sub> + 10<sub>10</sub> + 4<sub>10</sub> = 214<sub>10</sub>

Previously we split the number up into ones, tens, hundreds, thousands, ... all
the powers of ten. Now we're splitting up the number by the powers of five.

<aside class="note">
<p>
If it's been a while since your last arithmetic class, Here's a crash
course on exponentiation. Remember that ten to the power of three is
10<sup>3</sup> = 10 &times; 10 &times; 10 or "three tens multiplied together".
Two special cases to also keep in mind:
</p>
<p>X<sup>1</sup>=X</p>
<p>X<sup>0</sup> = 1 (if X isn't 0)</p>
</aside>

The important thing to take away from this is that a sequence of digits means
different things depending on the base it's written in.

If we are okay with reading and writing in base 5, then we could simplify our
machines by removing the digits 6-9. Our wheels would be smaller and our
instruction lists would be shorter. If we remove more digits, we can make things
simpler still! Let's remove digits until we're left with the bare minimum: 0 and 1.
We now have 2 digits so this is called base 2 A.K.A. "binary". Counting in
binary works just like it does in other bases, but can get a little confusing
because we can't count very far before we run out of digits. For an example,
follow along as we count from 0 to 31 in binary:

     0:      0
     1:      1
     2:     10
     3:     11
     4:    100
     5:    101
     6:    110
     7:    111
     8:   1000
     9:   1001
    10:   1010
    11:   1011
    12:   1100
    13:   1101
    14:   1110
    15:   1111
    16:  10000
    17:  10001
    18:  10010
    19:  10011
    20:  10100
    21:  10101
    22:  10110
    23:  10111
    24:  11000
    25:  11001
    26:  11010
    27:  11011
    28:  11100
    29:  11101
    30:  11110
    31:  11111

If you skipped over that boring column of numbers, go back and seriously follow
along. I recommend writing the numbers down in order so that you can see how the
digits carry over. This binary counting pattern is at the heart of every
computer, so it's good to have an intuitive grasp of it. Converting from binary
to decimal is a good skill to have as well:

110101<sub>2</sub> = 1 &times; (2<sup>5</sup>) + 1 &times; (2<sup>4</sup>) + 0 &times; (2<sup>3</sup>) + 1 &times; (2<sup>2</sup>) + 0 &times; (2<sup>1</sup>) + 1 &times; (2<sup>0</sup>) = 32<sub>10</sub> + 16<sub>10</sub> + 4<sub>10</sub> + 1<sub>10</sub> = 53<sub>10</sub>

Notice how the method for conversion is the same as before, but wonderfully
simple: since the only digits are 0 or 1, each power of 2 is either added or not
added to the sum; no multiplication is required! Many computer scientists have
memorized the first several powers of 2 for this reason.

Let's think about how this affects our machines. The wheels of our adding
machine now seem rather silly, having only two digits each. They could now be
simple on/off switches. Our Turing machine is much simpler to program as well!
We needed 10 instructions for our decimal "plus 1" machine - with lots of
repetition among them - but in binary we only need 2:

    (0, 0, 1, N, 1)
    (0, 1, 0, L, 0)

Reading and writing binary can be tedious and confusing for humans, but for
computing machines it makes things so much easier! The fundamental unit of
information in computers is a binary digit. That being said, a single binary
digit cannot store very much information: it can only be 0 or 1. It is telling
of computer scientists' humor that this amount of information (a single binary
digit) is called a "bit". To make things more convenient for people, modern
computers usually deal with bits in groups of 8, called "bytes". Thus, small
binary numbers are usually written with the full 8 bits when dealing with
computers e.g. 2<sub>10</sub> = 00000010<sub>2</sub>. Large binary numbers that
require more than 8 digits are usually written as multiple bytes placed
end-to-end.

A byte can store the values 00000000<sub>2</sub> to 11111111<sub>2</sub>. Let's
figure out what this is in decimal. As a little trick, we can do
11111111<sub>2</sub> + 1<sub>2</sub> = 100000000<sub>2</sub> = 2<sup>8</sup> =
256<sub>10</sub> = 255<sub>10</sub> + 1<sub>10</sub>. Thus a byte can store
the values 0<sub>10</sub> to 255<sub>10</sub>.

Other Bases
===========

Putting bits in groups of 8 makes some things more convenient, but it's still
annoying to read and write all of those binary digits. To solve this problem,
computer scientists employ another tool: hexadecimal.

Hexadecimal is the fancy word for base 16. 16 is more than 10 so where we
previously had fewer digits to use, now we _add_ 6 more digits! It is telling of
computer scientists' creativity that these new digits are A, B, C, D, E, and F.
Counting in hexadecimal looks like this:

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F, 10, 11, 12, 13, 14, 15, 16, 17,
18, 19, 1A, 1B, 1C, 1D, 1E, 1F, 20, ...

By now you might have a headache from trying to read all of these different
bases, but hexadecimal has a very nice property. Look at the first 16
hexadecimal digits and their binary equivalents:

    0 0000
    1 0001
    2 0010
    3 0011
    4 0100
    5 0101
    6 0110
    7 0111
    8 1000
    9 1001
    A 1010
    B 1011
    C 1100
    D 1101
    E 1110
    F 1111

Each hexadecimal digit can be represented with four bits. This mathematical
trick lets us read and write bytes as pairs of hexadecimal digits:

![Binary to Decimal](/images/hex.png)

Being able to read and write numbers in hexadecimal is a handy skill for
computer scientists. It is very succinct to read and write but also not hard to
see what the corresponding binary information is. Usually when superusers view
the raw data stored on a computer, they view it in hexadecimal.

Throughout this chapter I've used the mathematical notation of
<sub>sub</sub>scripts to show which base a number is written in. Computer
scientists don't really do this, though. Usually the base of a number is
obvious from the context so they don't write anything. But when they have
numbers of different bases mixed together, they add something _before_ the number
to indicate the base. For binary, they precede the digits with '0b', for
hexadecimal '0x', and for octal (base 8) they precede the digits with a zero.
If the digits have no prefix, it is assumed to be decimal. As far as computer
scientists are concerned, 2, 8, 10, and 16 are the only bases that matter.

0b10111001 = 0271 = 185 = 0xB9

This chapter's exercises are best done with some graph paper.

<aside class="exercises">
<ol>
<li>
Count from 0 to 10 in bases 2, 3, 4, 5, and 6. Write out the numbers such that
they line up with each other. Notice the patterns that emerge.
</li>
<li>
8 bits is called a byte so 4 bits is called a "nibble" (there's that computer
scientist humor again). Look back at the chart showing how hexadimcal digits
correspond to binary nibbles. Now count from 0 to 15 in binary, writing out all
4 bits of each nibble, just like in the chart. Trust me: do it. Do you notice
any patterns? Do you see a trick for easily counting in binary without needing
to add 1 and keep track of carrying?
</li>
<li>
Write out a random sequence of 16 ones and zeroes. Now convert your 16-bit
binary number to hexadecimal by breaking it into 4-bit groups. Repeat this a few
times until you start feeling comfortable with the process.
</li>
<li>
At the last minute I mentioned base 8 AKA octal. And earlier I showed you a
trick for quickly converting from binary to hexadecimal. Since 16 and 8 are
both powers of 2, can you find a similar trick for quickly converting from
binary to octal?  Do you see how this trick could apply to other pairs of
bases?
</li>
</ol>
</aside>
