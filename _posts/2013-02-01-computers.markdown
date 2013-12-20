---
layout: chapter
title: 'Part 1: Computers'
---

We're going to start by answering a question so fundamental that you might even
laugh that I ask it at all: what is a computer? Yes, I know you're using one
right now, but do you really know what a computer is? What is the difference
between a computer and a calculator? Other than size and shape, what makes
different computers different?  What makes one computer better than another?

We're going to learn the answers to all of these questions eventually. For now,
let's take a stab at answering that first question.

Q: What is a computer?

A: Something that computes.

Obvious, right? Now you have 10 seconds to define "compute". Not so obvious.
Don't worry, because even computer scientists had a hard time defining it. It
wasn't until the 1930s that anyone managed to put forth a decent definition for
the term, and even today no one can come up with an argument for why that
definition is the "right" one. We've all just agreed to hope that it's the
right one. Weird, right!?

So what is this definition?

<div class="alert alert-warning">
A <strong>computation</strong> is any function that can be evaluated using an
algorithm.
</div>

Woah, terminology alert! Let's break it down:

<div class="alert alert-warning">
A <strong>function</strong> is something that can be given input and will
return output. And if you give it the same input several times, it must return
the same output each time.
</div>

For example, "Given two integers, what is their sum?" is a function. Its input
is two numbers and its output is a single number. "What day of the week was it
on a certain date?" is also a function. With the date as the input, you can
look backwards or forwards in the calendar to see if that day was "Monday",
"Tuesday", etc. and that is your output. "What is your favorite color?" is
_not_ a function! If I ask you now, your output might be green, but if I ask
later on that could change. The output needs to be the same every time the
function gets the same input. You could say that the output depends only on
what the input is.

<div class="alert alert-warning">
Given a function and its input, the process of determining its output is called
<strong>evaluating</strong> the function.
</div>

For my previous example of what day of the week a certain date was, looking up
the date in a calendar would be "evaluating" the function.

<div class="alert alert-warning">
An <strong>algorithm</strong> is a well-defined, step-by-step process.
</div>

In other words, an algorithm is just a list of instructions. However, the
instructions must be _completely clear_. There should be no room for
interpretation. For example, "multiply this number by 2" would work as a step
in an algorithm since anyone who knows how to multiply will get the exact same
result. However "draw a pretty picture" would not work in an algorithm because
it's too ambiguous. What do you mean by "pretty"? What tools can we draw with?
What should I draw a picture of?

Now read it again: a computation is any function that can be evaluated using an
algorithm. A computation takes input and produces output by following a clear,
step-by-step process and where the output depends only on the input. Got it?
Good.

<div class="alert alert-success">
You might be wondering: since a computation is a function that can be evaluated
using an algorithm, does that mean there are functions that
<strong>can't</strong> be evaluated using any algorithm? Yes! They're both
really cool and beyond the scope of this book. Search the web for "uncomputable
functions".
</div>

Now get ready because here comes the first set of exercises. This isn't school
so you don't _have_ to do them and some problems are tricky enough that I don't
expect you to figure them out very easily. But remember that a superuser learns
by doing, so at the very least try to think about each question a little bit
before moving on.

<div class="alert alert-info">
<ol><li>
Come up with three more functions. What is the input? What is the output?  How
is the function evaluated?
</li><li>
Come up with something that takes input and produces output, but is
<strong>not</strong> a function. What makes it not a function? Can you turn
your non-function into a function by making it require more input?
</li><li>
You probably learned how to multiply long numbers by hand in elementary school.
Did you realize that the method you learned was an algorithm? Try to write out
a multiplication algorithm for multiplying a three-digit number by a one-digit
number as step-by-step instructions. Assume that the reader of the instructions
knows how to multiply and add only single digit numbers.
</li></ol>
</div>
