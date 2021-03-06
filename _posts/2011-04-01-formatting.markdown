---
layout: chapter
title: Formatting
category: part1
---

Last chapter we learned how computers do everything in binary... but that's just
a bunch of numbers. It seems like a far cry from the complex information we
store in computers these days. How does something like a game, or a song, or a
slide show get turned into a bunch of numbers? This is a big topic that we'll
discuss later on, but the basic idea is not too difficult.

Let's start with eight bytes. Remember, computers work with bytes rather than
bits for convenience. To keep things short, we'll write things in hexadecimal.

    00 00 00 00 00 00 00 00

Right now the bytes are all zero, but we want to store information in these
bytes. Eight bytes is 64 bits. That means we can store values from 0 to
2<sup>64</sup> &minus; 1. But can we really use all eight bytes? Real computers have
much more memory than just eight bytes; they can have hundreds of thousands of
bytes. With thousands of bytes around, how do you tell the computer that we
only want to use eight? One way would be to agree that the first byte says how
many bytes we're grouping together:

    08 00 00 00 00 00 00 00

We have seven bytes leftover to actually store information, so we can store
values up to 2<sup>56</sup> &minus; 1. Let's store a nice big number in there. How
about 4,240,876,579,651,596? That fills out the last seven bytes nicely:

    08 0F 11 0E 06 11 00 0C

But what if we want to store something other than numbers? We could store words
by agreeing that each byte will be one letter. A is 00, B is 01, C is 02, etc.
Then we could store up to seven letters with these bytes. Let's store the word
"program":

    08 0F 11 0E 06 11 00 0C

Huh. Now we have a problem. How does the computer know whether we are storing
the word "program" or the value 4,240,876,579,651,596? Well let's make another
agreement. After the number of bytes, we'll devote the second byte to describing
what kind of information we're storing. For example we could agree that 00 means
it's a number, 01 means it's letters, 02 could be a picture, etc. We only have
six bytes left, but at least now we can tell the difference between "turing" and
20,976,906,013,958:

    08 00 13 14 11 08 0D 06
    08 01 13 14 11 08 0D 06

You see? By grouping bytes in different ways and agreeing on the meanings of
different bytes, we can store a variety of information just using numbers. These
agreements have a technical term:

A **format** groups bytes together and assigns specific meanings to certain
bytes and byte values.
{: .definition}

## Size Matters ##

As I mentioned before, computers can have many, many bytes. To deal with this,
we have easier ways to refer to the huge numbers of bytes that come into play
when it comes to data. Bytes use the standard metric prefixes:

* 1,000 bytes is a **kilo**byte or KB
* 1,000 kilobytes is a **mega**byte or MB
* 1,000 megabytes is a **giga**byte or GB
* 1,000 gigabytes is a **tera**byte or TB

Terabytes are becoming more common these days, but it will probably be a few
years before the next prefix (peta) becomes common. There are some
complications, unfortunately. As you might recall from the previous chapter,
humans really like decimal but computers like binary. So while it is natural for
people to use kilo, mega, and giga, etc. to mean 1000<sup>1</sup>,
1000<sup>2</sup>, and 1000<sup>3</sup>, it is common for computer scientists to
use powers of 1024 = 2<sup>10</sup>. In other words, sometimes bytes are
measured like this:

* 1,024 bytes is a kilobyte
* 1,024 kilobytes is a megabyte
* 1,024 megabytes is a gigabyte
* 1,024 gigabytes is a terabyte

It is confusing. And it gets worse. Recall how the formatting of the data in the
previous section reduced the number of bytes we could use to store information.
Even though we had eight bytes, we could only use six after the formatting was
done. Computer components are often advertised as storing such-and-such
gigabytes of data&mdash;but is that using powers of 10 or powers of 2? Is that
before formatting or after formatting? One often needs to read the fine print
when it comes to measuring data.

## Limitations ##

We've taken a look now at how computers compute and how they store information,
but so far every example has boiled down to integers and counting. But aren't
there other kinds of math? Aren't there are other kinds of information? What
about numbers like &pi;? What about information like music and paintings? How
can we represent such things using a computer?

The truth, surprisingly, is that we _can't_&mdash;because computers deal exclusively
with discrete data.

**Discrete** data can be counted.
{: .definition}

For example, take the number of students in a class. It doesn't make sense to
have only part of a student in a class, you can only change the number of
students by whole numbers. Letters are similarly discrete, since a letter must
be one of the letters of the alphabet; a letter cannot be somewhere between A
and B. In contrast, lots of things we perceive in real life are continuous.

**Continuous** data can only be measured.
{: .definition}

For example, your height is continuous since you can't suddenly switch from
being one height to another. The light that we see and the sound waves we hear
are also continuous since they can transition smoothly from one state to
another. A good test for something being discrete versus continuous is whether
the precision of the measurement matters. While you can count the number of
students in a class and be 100% sure of your answer, your height depends on
what tool you use to measure it and how precisely you record the value. If you
use a more precise tool on continuous data, your answer can change.

As you might expect, these limitations on data translate over to the types of
information we can store with data.

<div class="deeper">
The words "data" and "information" are used almost interchangeably these days,
but there's a subtle difference between them. To put it simply, information has
meaning whereas data are just cold, hard facts.

In a computer, the bits and bytes are data. The interpretations of those data
create information.
</div>

Discrete data can only produce **digital** information.
{: .definition}

Only continuous data can produce **analog** information.
{: .definition}

![Continuous vs. Discrete]({{ site.baseurl }}/img/digital.png)
{: .pull-right}

This surprising distinction is often misunderstood by those unfamiliar with
computers. The distinction implies that if we want to store any continuous data
in our computer, or have the computer produce any continuous data, we need to be
able to convert between digital and analog information. Technically, this is
impossible. Instead we make do by _approximating_ analog information with
digital information and then later _reconstructing_ analog information from the
digital approximation.

Imagine a perfect circle. No matter how far you zoom in to the edge, it's still
a perfectly smooth curve. The circle represents continuous data. Now imagine
that I asked you to make a copy of that circle, but you can only use squares.
The squares represent discrete data. You could try to fill in the outline of the
circle with squares. The result might have gaps or corners, but if the squares
are small enough, the result will look a bit like a circle. If I then asked you
to recreate the circle based on your copy, you could try to trace around the
edges of the squares. The quality of your result would depend on how well your
squares approximated the original circle.

Like fitting a square peg into a round hole, the process is by definition
imperfect.  A huge amount of effort is expended by computer scientists and
engineers to improve our digital approximations of continuous data.

Possibly because of the complexity that formats can require to store
information, formats are sometimes thought of as "codes". Just like our DNA
encodes the information for our living bodies, formats encode the information we
store in our computers.

Information can be **encoded** to store it in formatted data. The data can be
**decoded** to get the information back again.
{: .definition}

## Exercises ##

<div class="exercise" style="clear: right">
1. So far, all of the calculations we've toyed around with have used positive
   integers. Those are easy because it's rather obvious how to represent a
   positive integer using bits and bytes. Come up with a format for storing
   negative integers as well as positive ones. Then try to make a format for
   storing numbers with a decimal point e.g. 3.14 or &minus;1.0007.
2. Come up with three examples of digital information and three examples of
   analog information.
3. Computer images are usually displayed using additive color. That means that
   each color is represented as a mixture of the three primary additive colors:
   red, green, and blue. Create a format for storing a color in a computer using
   the additive model. What choices do you get to make when designing this
   format? Do any of your choices impose limitations on the colors stored using
   your format? Can you get around these limitations?
</div>
