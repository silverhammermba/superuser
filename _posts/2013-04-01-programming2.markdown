---
layout: chapter
title: High-Level Programming
category: part3
---

In the previous chapter, we improved the difficult task of writing machine code
by writing in a more understandable language called assembly and using a program
to turn the assembly into machine code. You could say that assembly is "one
step removed" from machine code, which is what makes it easier to write. In this
chapter we're going to look at two new and very different ways of creating
programs that are even further removed from the machine code, and thus even
easier to work with.

## Compilers ##

Last chapter I said "we need to translate our assembly back into machine code".
That word "translate" was especially appropriate because we can think of machine
code as the "language" of CPUs whereas assembly is a "language" for humans. Like
normal languages, we can express similar ideas in both machine code and assembly
and translate between them in order for humans to "communicate" these ideas to
the CPU.

To further improve on our program creation process, we can do the same trick
again: we can use an even _more_ understandable language and a program which
translates _that_ language into assembly (and then the assembly into machine
code).

A **compiler** is a program which translates from one programming language to
another (usually simpler) programming language.
{: .definition}

"Simple" here refers to the complexity of the language itself, not the
difficulty of using the language. It is usually easier to express a complex idea
in a complex language (and it can be [hilariously difficult][upgo] in simple
language).
{: .note}

[upgo]: https://xkcd.com/1133/

So how does a compiler solve the problems we had with assembly? First, we can
program our compiler to translate our language into different assembly code
depending on the CPU we need to run the program on. This way we can write a
program once and the compiler will translate that program to run on many kinds
of computers. Second, we can replace confusing assembly instructions with more
human-readable ones and let the compiler translate into assembly for us. Third,
we can identify common _patterns_ of assembly instructions (e.g. the four
instructions for sending an exit code) and replace these with shorter
human-readable instructions that the compiler will expand back into the
corresponding pattern of assembly.

Another benefit of compiling a language into assembly is that we can make the
language _more_ restrictive. This might sound like a bad thing, but consider
this: our example assembly program last chapter put its exit code in register
BL, but what if we had left out that `movb $7,%bl` instruction from our assembly
program? Our program would still run, the CPU would still follow the
instructions, and the kernel would still look at EAX and BL to exit our program.
But what would the exit code be? What is in register BL? Maybe some CPUs set all
the registers to 0 before running a program, so it would be 0. Maybe some set
the registers to 42, so that would be the exit code. Or maybe the CPU doesn't
touch the registers and whatever the last program happened to leave in register
BL will still be there. Who knows? This is what programmers call "undefined
behavior": when the result of running a program is outside of our control. It's
one of the worst things that can happen to a program! Since a compiler creates
the assembly code, it can help us with this problem by refusing to translate
instructions that would lead to undefined behavior. By being more restrictive,
compilers can help us create better programs.

### C ###

The compiled language we're going to learn about is one of the oldest and most
popular languages: C.

"C" seems like an odd name for a language, but it has some interesting history
behind it that once again demonstrates that classic computer scientist humor. In
1966, a Cambridge Ph.D. student designed a compiled language that he called the
Basic Combined Programming Language, or BCPL. A few years later in 1969 at AT&T,
the creators of UNIX decided that they should rewrite UNIX (which was entirely
written in assembly) using a compiled language. They liked some features of BCPL
but found the language too complicated, so they designed a simpler version which
they called just "B". But as computer technology developed, they found that B
was unable to take advantage of the latest computer innovations so in 1972 they
designed a new language as its successor: C. By 1973 UNIX was almost entirely
written in C. Today, C is still considered the go-to language for large,
complicated programs like operating systems.
{: .deeper}

Like assembly, C is written as plain text, but unlike assembly it no longer
clearly corresponds to the instructions that will be run by the CPU. Let's
recreate the `sevn` program from last chapter in C.

<div class="exercise">
Open up `nano` again and type this:

{% highlight c %}
int main()
{
    return 7;
}
{% endhighlight %}

Save the file as `sevn.c`. Note that the indentation is not important, it just
improves readability. You could write this all on one line if you like: `int
main(){return 7;}`
</div>

By now things are readable enough that we shouldn't really need a checksum to
check our work. Once your code is written, compile it using `gcc` (think of it
as the **G**NU **C** **c**compiler):

    # gcc -o sevn3 sevn.c

`-o` specifies the output file. `gcc` is nice enough to compile into assembly,
assemble into machine code, and link into an executable all in one command (but
we could split up these steps if we wanted to)! And finally

    # ./sevn3
    # echo $?
    7

It still works! Now open up `sevn3` in `hexedit`. What the heck? How did our
tiny program become so huge? One problem with compiled languages in general is
that they often make assumptions about the types of programs you will write. In
this case, `gcc` has included lots of extra information and instructions that
our program doesn't need because it's so incredibly simple, but most other
programs will need. And don't even bother looking for our familiar instructions
in here&mdash;they could be scattered all over the place or replaced with
slightly different instructions that have the same effect. With compiled
languages you just have to trust that the compiler will produce the right
instructions and not look at how the sausage is made. We got the right exit
code, so all is well in the world.

<div class="exercise">
To see how `gcc` translates your C code into assembly, use the `-S`
argument:

    # gcc -S -o - sevn.c

`-o -` tells it to just print the result in the shell rather than save it to a
file. Isn't it interesting how such different CPU instructions can have the same
result? Can you find the exit code in this assembly? Can you see some extra
information that the compiler is including which is unnecessary?
</div>

Sometimes&mdash;very rarely&mdash;you [do need to care][bug] how the
compiler creates instructions.
{: .deeper}

[bug]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=323

Now that we're using C, our simple 7 program just doesn't demonstrate the
capabilities of the programming language. We need to make more complicated
programs.

### Paradigms ###

One of the big advantages of using a high-level programming language like C (as
opposed to a low-level language like assembly or machine code), is that we are
no longer constrained to thinking about the particular physical components of
the computer and how they interact. Instead, the programming language allows
us to express our ideas in a completely different way that might have no obvious
connection with the inner workings of the computer. As long as the compiler can
translate these ideas into a language that the computer _does_ understand, we're
okay.

For example, suppose we wanted to make a program that stores a list of numbers
for us. If we were to write this program in assembly we would have to think hard
about where to store these numbers. If the list is short (like 5 or 10 numbers)
we might be able to get away with storing them in the CPU's registers. But if
the list is long (like 100 numbers) then there aren't enough registers so we'll
need to store them elsewhere like in the RAM or HDD. We also have to think hard
about what _kinds_ of numbers we're storing because positive integers, negative
integers, and decimal numbers all have different binary formats. If we forget
which numbers of which formats were stored where, we'll be in trouble. But with
a language like C, we can just write something like this:

{% highlight c %}
int x = -7;
unsigned int y = 1337;
double z = 1.5;
{% endhighlight %}

Here we're telling the compiler to store three numbers: an integer (`int`) which
can be positive or negative, a positive integer (`unsigned int`), and a decimal
number (`double`). We also give these numbers names (x, y, and z) so that we can
refer to them later in the program. But where will the compiler tell the
computer to store these numbers? We don't need to care!

When you write `int x = -7;` you are telling the C compiler to store that number
_somewhere_ on the computer. When the compiler turns your C code into assembly,
it can examine how that number is used in your program and how the hardware of
the computer works, and it can decide to store the number in a different
location depending on the situation. For example if it sees that the number is
just being used as the exit code for the program, it might decide to put it
right in register BL. Or if the number is being used alongside many other
numbers, it might decide to store it in the RAM. Or if the compiler sees that
you don't use the number anywhere in your program (maybe you put it in by
accident) it might not store the number anywhere at all! So when you write `int
x = -7;` you really can't know for sure how that will correspond to actual
machine code; instead you must think in more abstract terms. You can imagine C
putting the number -7 in a box for you and labelling it "x". The compiler
handles taking the number out of the box or putting a different number in the
box, so you don't need to think about how that box corresponds to low-level
machine code.

This more abstract way of thinking about a program is what we call a programming
paradigm.

A **programming paradigm** is an abstract way of structuring programs. In other
words, a programming paradigm is a certain way of breaking down a problem in
such a way that a program can be created to solve it.
{: .definition}

To make this concept more concrete, imagine that you are a carpenter. When you
start a new carpentry project, how do you break down the project in your mind?
One way would be to think of the project in terms of steps: first you build a
frame, then you fill in the rest of the structure, then you add smaller details,
then you paint and finish the wood. And some of these steps could consist of
sub-steps, so to paint and finish the wood, first you sand the surface, then you
apply a coat of paint, then you let it dry, then a coat of varnish, etc. A
different approach might be to think of the project in terms of components, so
you break down the project into separate pieces (walls, floor, supports, etc.)
and determine how the pieces will connect. Then you can finish each piece
individually in whatever order you like and attach them all. These approaches
are very different but both could be used to tackle any sort of carpentry
project. We could call these different _carpentry paradigms_.

Programming paradigms are very similar. They affect only how we humans think
about programs; the compiler always ends up translating the program into machine
code for the CPU. So it's entirely possible that we could write a program two
different ways in two different programming languages that follow two different
programming paradigms, but both end up being compiled to the exact same machine
code&mdash;just like a carpenter could build a birdhouse step-by-step or as
separate components and get the same result either way.

The C programming language follows a "procedural" programming paradigm. This
paradigm is kind of like the step-by-step approach for carpentry: it breaks down
every program into "procedures", where each procedure is a list of steps for the
computer to follow. The twist is that a procedure can have other procedures as
its steps. Let's look at a fake C program where we'll pretend that our computer can
do carpentry:

{% highlight c %}
void build_birdhouse()
{
    build_a_frame();
    fill_in_structure();
    add_details();
    paint_and_finish();
}

void paint_and_finish()
{
    sand();
    apply_paint();
    dry();
    apply_varnish();
}
{% endhighlight %}

`void build_birdhouse()` is C's way of saying "make a procedure named
`build_birdhouse`". Then we simply list the instructions of building a birdhouse
in order, surrounded by `{ }`. The first step `build_a_frame()` is C's way of
saying "follow the steps of the procedure named `build_a_frame`". So this is
what we talked about earlier: a step in a procedure being another procedure. We
can see that the other three steps of this procedure are also procedures
themselves (that's what the `()` indicates).

We can also see that the last step of building a birdhouse `paint_and_finish` is
defined right below, and it also consists of four procedures. So this is the
main advantage of the procedural paradigm: breaking down large tasks (like
building a birdhouse) into smaller and smaller tasks so that we don't have to
think about the entire thing at once.

### A Real C Program ###

Enough of the fake code, let's make a real program that does some work. The goal
of this program will be to find the answers to the math problems 3&times;4,
-31&times;57, and 12&times;8. Let's start by thinking about what procedures we
should make. Our main purpose is to solve the three problems, so we could start
with a procedure like this

{% highlight c %}
void main()
{
    solve_and_print_problem1();
    solve_and_print_problem2();
    solve_and_print_problem3();
}
{% endhighlight %}

Now let's make the `solve_and_print_problem1` procedure.

{% highlight c %}
void solve_and_print_problem1()
{
    int x = 3;
    int y = 4;
    int z = x * y;
}
{% endhighlight %}

Remember earlier that we saw how to tell C to store numbers for us. We use that
again here to store the numbers we need to multiply. We also see that by using
`*`, C can multiply numbers it has stored. So now the result of 3&times;4 (what
could it be?) is stored somewhere on the computer in a box that C has labelled
`z`. All that is left to do is print the result, but before we get to that let's
think about our other `solve_and_print_problem` procedures.

The other two procedures will be pretty much the same, just with different
numbers stored as `x` and `y`.

{% highlight c %}
void solve_and_print_problem1()
{
    int x = 3;
    int y = 4;
    int z = x * y;
}

void solve_and_print_problem2()
{
    int x = -31;
    int y = 57;
    int z = x * y;
}

void solve_and_print_problem3()
{
    int x = 12;
    int y = 8;
    int z = x * y;
}
{% endhighlight %}

This is pretty repetitive. And whenever you have repetitive code, that's usually
a sign that there's a better way to do things. In this case, we can make things
better by using _arguments_. Just like how shell commands accept arguments to
change their behavior, C procedures can accept arguments to change their
behavior. Look at how we can turn these three similar procedures into one
procedure where `x` and `y` are arguments:

{% highlight c %}
void solve_and_print_problem(int x, int y)
{
    int z = x * y;
}
{% endhighlight %}

By putting `x` and `y` in the `( )`, we're telling C that these numbers are
arguments which can change every time the procedure is run. Now we have to
change our `main` procedure to pass these arguments:

{% highlight c %}
void main()
{
    solve_and_print_problem(3, 4);
    solve_and_print_problem(-31, 57);
    solve_and_print_problem(12, 8);
}
{% endhighlight %}

Now you can imagine that when C sees the first step in our `main` procedure, it
picks up the values `3` and `4` and places them in the boxes `x` and `y` in our
`solve_and_print_problem` procedure before following its steps. Now we can get
back to the business of printing the answer.

Printing the answer in the shell is actually quite a complex task, because
printing is output, and all I/O is controlled by the kernel. So we're going to
need to set up some CPU registers and send an interrupt. Ugh. But since we're
using C, life is much more wonderful. A key component of many operating systems
(including this one) is the **C standard library**, a collection of hundreds of
C procedures designed and tested by expert programmers for performing common OS
tasks (such as printing output).

In particular, we will use the `printf` (**print** **f**ormat) procedure from
the `stdio` (**st**an**d**ard **I/O**) portion of the standard library. This
procedure works in a funky sort of way, so let's just look at how to add it to
our `solve_and_print_problem` procedure:

{% highlight c %}
#include <stdio.h>

void solve_and_print_problem(int x, int y)
{
    int z = x * y;
    printf("%d x %d = %d\n", x, y, z);
}
{% endhighlight %}

<div class="deeper">
The C standard library is also documented in the manual. To read about library
procedures, add `3` as an argument before the procedure name. `3` specifies that
you want the standard library section of the manual (some procedures have
the same name as a program or other shell command).

    # man 3 printf
</div>

Now our two procedures do everything we need them to, so we're done. Since our
code is sort of scattered throughout the chapter, let's collect the whole
program in one place here and add a couple small, finishing touches.

{% highlight c %}
#include <stdio.h>

void multiply_and_print(int x, int y)
{
    int z = x * y;
    printf("%d x %d = %d\n", x, y, z);
}

int main()
{
    multiply_and_print(3, 4);
    multiply_and_print(-31, 57);
    multiply_and_print(12, 8);

    return 0;
}
{% endhighlight %}

First, I renamed the `solve_and_print_problem` procedure to better reflect what
it does (not strictly necessary but usually a good idea). Lastly I added an exit
code. You see, I sneaked something past you earlier: `main` isn't some arbitrary
procedure name in C, it's _special_. When you compile and run a C program, it
only performs the steps in the `main` procedure. If you want other procedures to
run, you need to make them steps in `main` (like we did with
`multiply_and_print`). Also, in addition to accepting arguments, C procedures
can "return" a value when they are finished. Whatever `main` returns is the exit
code for the program, so I've changed the `void` to `int` (meaning it returns an
integer rather than nothing) and added `return 0` to indicate that everything
worked.

Now that you know how `main` and `return` work, can you understand how our
simple `sevn.c` program works?
{: .exercise}

In C, procedures are more commonly called **functions**, even though they aren't
functions in the strict mathematical sense. But they do take input (via their
arguments) and give output (via the return value) and _usually_ the output
depends only on the input.
{: .deeper}

If you want to, you can use `nano` to create the file `mult.c` with that text
then compile and run it like so:

    # gcc -o mult mult.c
    # ./mult
    3 x 4 = 12
    -31 x 57 = -1767
    12 x 8 = 96

Pretty cool stuff!

<div class="exercise">
Modify the C program so that it has the following output. Then compile and run
it to verify.

    3 + 4 = 7
    -31 + 57 = 26
    12 + 8 = 20
</div>

Subtly, a very significant change has occurred now that we're writing programs
in C. Think about our programs from the context of another computer user who is
running them. They might like the programs but wish that they worked in a
slightly different way, or they might simply be curious about how they work and
want to see for themselves. For both of these tasks, it is very helpful if the
user can do something with the machine code in order to see the program's code
as we (the designers) saw it.

For our machine code program, they can simply open the program file in hexedit
and see the exact same code that we did when we wrote it. For our assembly
program, they can translate the assembled machine code back into assembly (since
assembly is basically a 1-to-1 translation of machine code) and also see
(essentially) the same assembly code that we saw when we wrote it. But what
about C?

We know that C uses a programming paradigm, so our C code does not correspond
1-to-1 with machine code like assembly does. And I mentioned earlier that
different compiled languages, possibly with different programming paradigms, can
be compiled into the same machine code. So the short answer is that it is
**impossible** for another user to see our C code given only the compiled
machine code! You can get a sense of this for yourself by opening the compiled
`mult` program in `hexedit`. Do you see `multiply_and_print` anywhere? How about
`x * y`? Somewhere in the process of translating our abstract high-level C code
into assembly, the _structure_ and _meaning_ has been lost. This doesn't matter
to the computer but for humans who may want to understand our program it makes
life very difficult. Practically the only way other users can modify our program
is if they can get a copy of our original C code and then recompile it.

The original code that computer programmers use to develop a program is the
program's **source code**. Source code is often written in a compiled language
and is later translated into machine code. The resulting machine code is called
a **binary blob** (emphasizing the often confusing lack of structure in compiled
machine code).
{: .definition}

Binary blobs are one of the reasons that software companies can sell their
software for hundreds or thousands of dollars. If a program uses really clever
algorithms, these algorithms are very difficult to reconstruct from the compiled
machine code. That makes it harder for a competing company to simply buy the
software, figure out its design from the machine code, make some nominal
changes, and then resell it as their own.

<div class="deeper">
The short answer is that it is impossible to translate from machine code back to
C, but the long answer is more nuanced. It _is_ impossible to determine what the
_original_ source code was, but getting _close_ is often good enough. Computer
programmers usually write source code in a fairly understandable, structured
way. So even though there may be countless variations of source code that would
compile to the same binary blob, there may only be a handful of variations that
have a logical structure to them.

If we can create some C code that compiles to the same binary blob, and which
reflects at least the _structure_ of the original source code, that can provide
great insight into how the program was originally designed.

**Reverse engineering** is the process of creating source code (such as C) from
obfuscated code (such as a binary blob). This process usually involves lots of
slow, manual work.
{: .definition}
</div>

## Scripting ##

We saw how great a compiled language can be compared to assembly, but do
compiled languages have any downsides of their own? Sort of. Compiled languages
are often called "static" because in a sense the resulting programs are very
rigid and unchanging. For example, with our previous C program, if we want to
change any of the program code we need to recompile the source. In a way, this
is an advantage because the compiler can do things like check for mistakes or
optimize our algorithms when it compiles the source code. But it is also a
disadvantage because the resulting program is not flexible nor easy to change
(we need to recompile it every time). Making a C program more flexible and
"dynamic" is certainly possible, but it requires hard work and can be very
difficult to do well. This is where the scripting languages come in.

A **scripting language** is a programming language where the instructions are
read and carried out directly by another program (rather than translated into
machine code for the CPU to carry out).
{: .definition}

The distinction between scripting languages and compiled languages is subtle, so
let's think about it in a different way. Recall our original fake C program that
had procedures like `apply_varnish`. In C, we would have to define the steps
of `apply_varnish` ourselves and the compiler would need to be able to translate
all of those steps into machine code. But what if we're doing a _lot_ of wood
working and `apply_varnish` is something _fundamental_ to our
workflow&mdash;something we'll be doing all the time? It seems kind of
overcomplicated to need to always break it down into tiny little machine code
instructions that the CPU can understand. Wouldn't it be cool if we had a
special "wood working computer" that understood `apply_varnish` as one of its
basic instructions?

Well we already know from the VM we're playing around in that it's no problem
for a computer to simulate another computer inside itself. So we could design
our special wood working computer _in code_ and simply simulate it inside our
computer. Then we could issue instructions like `apply_varnish` directly to the
simulated computer's CPU as if it were a real, physical computer. That is
basically how scripting languages work: rather than using a program to translate
our instructions into machine code, a program reads our instructions and
simulates the result of running them itself.

An **interpreter** is a program which reads program instructions and simulates
the result of running those instructions. Scripting languages are often called
**interpreted languages** since they almost always need to be read by an
interpreter.
{: .definition}

The analogy between virtual machines and interpreters is so strong that many
interpreters are actually refered to as VMs (even though they aren't simulating
a real computer like our Arch Linux VM is).

So what's the advantage of an interpreter and what does it have to do with
"dynamic" programs? Recall that with C, a big task for the compiler was making
sure that our programs made sense and didn't include weird stuff like undefined
behavior. That was important because sending bad instructions to your actual CPU
can be dangerous. But with an interpreter we're running a _simulated_ CPU, so
there's no need for the interpreter to read ahead or verify anything: it can
simply follow each instruction as it gets to it. This allows for far greater
flexibility than in languages like C. For example, we can add instructions for
the interpreter on-the-fly and completely change the behavior of the code while
it is already running.

<div class="deeper">
If you're paying close attention you might have noticed that I'm conflating two
different ideas when talking about programming languages. On the one hand,
there's the _linguistic_ aspect of the programming language: the syntax and
grammar of the text that we type into the computer. On the other hand, there's
the _implementation_ of that text to make the computer actually carry out the
desired actions. When I say that C is a compiled language, I make it sound like
the syntatical, grammatical nature of C is somehow connected with the compiler
that implements C and turns it into machine code but in reality there is no such
connection. While C is usually compiled into machine code, there _are_
interpreters that can simulate its instructions. Similarly while most scripting
languages are interpretted, you could technically design a compiler to turn the
instructions into machine code (though it probably wouldn't be easy).

The reason why these two meanings are conflated is simply practical. Usually the
design of the language lends itself to one of the approaches better than the
other. If a language is easy to compile into machine code it probably doesn't
have the dynamic features that makes scripting languages useful, so by
interpreting it you're losing the benefits of a compiler without any major gain.
If a language has lots of dynamic features that make an interpreter fitting,
designing a compiler is probably going to be impractically complicated and will
end up creating very large, inefficient machine code programs.
</div>

The scripting language we're going to play around with is called Ruby. Let's
create a simple Ruby program to demonstrate the dynamic nature of the language.
Programs in scripting languages are often called "scripts".

<div class="exercise">
Create a text file named `eval.rb` with the following text

{% highlight ruby %}
x = eval gets

puts x * 3
{% endhighlight %}
</div>

Running a Ruby script is very different from the previous programs because we
don't have to turn it into executable machine code. Instead we simply pass the
filename as an argument to the ruby interpreter.

    # ruby eval.rb

After entering this command, your prompt will simply sit there and do nothing.
That's because also unlike our previous programs, this one expects some input
from the user. For now just provide no input by pressing <kbd>Enter</kbd>:

    # ruby eval.rb
    
    eval.rb:3:in `<main>': undefined method `*' for nil:NilClass (NoMethodError)

Ruby just spat out an error message at us. Rude! What happened here is we told
Ruby to multiply x by 3 and Ruby doesn't know what x is, so it can't do the
multiplication (specifically it says x is "nil", meaning nothing, and it doesn't
know how to multiply nothing). This kind of program would never fly in C,
because the compiler would complain long before we ever try to run the
instructions. But since Ruby is interpreted, it can't know that there is a
problem until it actually runs all of the previous instructions and gets to the
problematic one.

Now run the script again, only this time provide some input by typing `2` and
<kbd>Enter</kbd>

    # ruby eval.rb
    2
    6

No more error message! `x = eval gets` is basically the Ruby way of saying "x is
whatever the user inputs". Since we told it x is 2, it can do the multiplication
just fine, so it prints 6 since 2&times;3=6. But Ruby knows how to multiply more
than just numbers. This time, try telling Ruby that x is `"ha"`

    # ruby eval.rb
    "ha"
    hahaha

Pretty cool! This tiny little Ruby script can have such different behavior all
depending on the input we give it. Would it be possible to create such a program
in C? Sure, but take my word for it that it would be _much, much_ trickier than
that cute little two-line script we just wrote.

That example shows off the really dynamic nature of Ruby, but you don't _have_
to use Ruby for dynamic programs like that. Here are the other two programs we
made, rewritten using Ruby. First, `sevn.rb`

{% highlight ruby %}
exit 7
{% endhighlight %}

and `mult.rb`

{% highlight ruby %}
def multiply_and_print x, y
  z = x * y
  puts "#{x} x #{y} = #{z}"
end

multiply_and_print 3, 4
multiply_and_print -31, 57
multiply_and_print 12, 8
{% endhighlight %}

