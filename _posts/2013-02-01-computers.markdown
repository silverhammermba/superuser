---
layout: chapter
title: Computers
---

Part 1: Computers
=================

We're going to start by answering a question so fundamental that you might even
laugh that I ask it at all: what is a computer? This is a funny question since
you're using one right now. You could answer it succinctly by pointing at the
screen you're reading, but let's take it seriously for a moment. Do you really
know what a computer is? What is the difference between a computer and a
calculator? Other than size and shape, what makes different computers different?
What makes one computer better than another?

Let's take a stab at answering that first question.

Q: What is a computer?

A: Something that computes.

Obvious, right? Now you have 10 seconds to define "compute"... and now that
you've failed to do so you can go back and apologize to that answer that seemed
so foolishly obvious; because it turns out that computation is surprisingly
tricky to define. It wasn't until the 1930s that anyone managed to put forth a
decent definition for the term, and even today no one can come up with an
argument for why that definition is the "right" one. We've all just agreed to
hope that it's the right one. Weird, right!?

So what is this definition?

<div class="definition">
	A <strong>computation</strong> is any function that can be evaluated using
	an algorithm.
</div>

Woah, terminology alert! Let's break it down: a _function_ is something that
can be given input and will return output. And it must return the _same_ output
every time when you give it the same input.  For example, "Given two integers,
what is their sum?" is a function. Its input is two numbers and its output is a
single number. "What day of the week was it on a certain date?" is also a
function. With the date as the input, you can look backwards or forwards in the
calendar to see if that day was "Monday", "Tuesday", etc. and that is your
output. "What is your favorite color?" is *not* a function! If I ask you now,
your output might be green, but if I ask later on that could change! The output
needs to be the same every time the function gets the same input. You can think
of the output as depending only on what the input is.

When a function is _evaluated_, I mean that given an input to the function we
determine what the output of the function is. Looking up the date in a calendar
would be "evaluating" my previous function example.

An _algorithm_ is a well-defined, step-by-step process. In other words, an
algorithm is just a list of instructions. However the instructions must be
*completely clear*. There should be no room for interpretation! For example,
"multiply this number by 2" would work as a step in an algorithm since anyone
who knows how to multiply will get the exact same result. However "draw a
pretty picture" would not work in an algorithm since it's so ambiguous! What do
you mean by "pretty"? What tools can we draw with? What should I draw a picture
of?

Now read it again: a computation is any function that can be evaluated using an
algorithm. A computation takes input and produces output by following a clear,
step-by-step process and where the output depends only on the input. Got it?
Good.

<div class="deeper">
	You might be wondering: since a computation is a function that can be
	evaluated using an algorithm, does that mean there are functions that
	<strong>can't</strong> be evaluated using any algorithm? Yes! They're both
	really cool and beyond the scope of this book. Search the web for
	"uncomputable function".
</div>

Now get ready because here comes the first set of exercises. This isn't school
so you don't _have_ to do them and some problems are tricky enough that I don't
expect you to figure them out very easily. But remember that a superuser learns
by doing, so at the very least try to think about each question a little bit
before moving on.

<div class="exercises">
	<ol>
		<li>Come up with three more functions. What is the input? What is the
		output? How is the function evaluated?</li>

		<li>Come up with something that takes input and produces output, but is
		<strong>not</strong> a function. What makes it not a function? Can you
		turn your non-function into a function by making it require more
		input?</li>

		<li>You probably learned how to multiply long numbers by hand in
		elementary school. Did you realize that the method you learned was an
		algorithm? Try to write out a multiplication algorithm for multiplying
		a three-digit number by a one-digit number as step-by-step
		instructions. Assume that the reader of the instructions knows how to
		multiply and add only single digit numbers.</li>
   </ol>
</div>
