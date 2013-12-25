---
layout: chapter
title: Selected Exercise Answers
---

## Part 1: Computers ##

1. Not provided.
2. For the example of "What is your favorite color?", it can be made into a
   function by adding time to the input: "What is your favorite color _right
   now_?"
3. Here's the algorithm I learned:
    1. Write down the three-digit number X with the one-digit number Y
       underneath its rightmost digit and a line underneath that.
    2. Multiply Y by each digit of X, starting from the right. For the result R
       of each mulitiplication
        1. If there is a digit above the mulitiplied digit of X, add it to R.
        2. If R has two digits, place the right digit underneath the
           corresponding digit of X (below the line). Place the left digit
           above and one place to the left of the corresponding digit of X.
        3. If R has one digit, place R underneath the corresponding digit of X,
           below the line.
    4. If you end up with a digit above and to the left of the last digit of X,
       write it below the line as well.
    5. The digits below the line are your answer.

## Simple Machines ##

1. Very similar to the case of addition:

        (0, 1, 0, N, 1)
        (0, 2, 1, N, 1)
        (0, 3, 2, N, 1)
        (0, 4, 3, N, 1)
        ...
        (0, 8, 7, N, 1)
        (0, 9, 8, N, 1)
        (0, 0, 9, L, 0)

   The result with an input of 0 will be an underflow i.e. filling the tape
   with 9s. You can get around underflow using the next exercise.
2. With letters, you can mark the ends of your input numbers e.g. inputting X0
   for 0. Then you can create rules that stop the computation when the end of
   the input is reached. If you're really clever, you can figure out a way to
   do this even without letters.
3. This is a tough one. The trick is to use to binary for input and output, as
   demonstrated in the next chapter.

## Bases ##

1. Not provided.
2. The trick is to look at columns. The rightmost column alternates 010101...,
   the next alternates in twos 00110011.., the next in fours 000011110000...,
   and so on.
3. Not provided.
4. Hexadecimal digits correspond to quadruplets of binary digits, and octal
   digits correspond to triplets of binary digits. Note that 16 = 2<sup>4</sup>
   and 8 = 2<sup>3</sup>. From there it should be easy to guess what the tricks
   are for converting between base 3 and base 9 or base 6 and base 36, etc.

## Formatting ##

1. The simplest format for storing negative numbers is to devote the first bit
   to storing the sign of the number (e.g. 0 for positive, 1 for negative). How
   would you use this format? What sort of algorithm would you need to make in
   order to perform arithmetic with positive a negative numbers?

   <div class="alert alert-success">
   Actual computers use a much more clever format called "two's complement". This
   format takes advantage of modular arithmetic to represent negative numbers in a
   way so that you can add, subtract, and multiply them using the <em>same</em>
   algorithm you use for positive numbers!
   </div>

   One format for storing decimal numbers would be to use two bytes X and Y.
   Then each number is defined as X &times; 10<sup>Y</sup>. That way X and Y can
   be normal integers, but by making Y negative we can represent small numbers
   e.g. X = 205, Y = -1, 205 &times; 10<sup>-1</sup> = 2.05.

2. The amount of money you have is digital information. Temperature is analog
   information. Other examples you should figure out on your own.

3. The color format often used by computers has three bytes representing red,
   blue, and green respectively. Each byte is an integer where 0 means the
   absence of that component, and 255 means that part of light is strongest. In
   this format (in hexadecimal), 000000 is black, <span style="color: #5A0000">5A0000</span>
   is dark red, <span style="color: #f0f">FF00FF</span> is bright purple, and
   <span style="color: #fff; text-shadow: 1px 1px 1px black">FFFFFF</span> is white.

   Since this format uses three bytes, it can represent only about 16.7 million
   distinct colors. You can use more or fewer bits per color component if you
   want to represent more or fewer colors.

   Color is analog information, which means that we can never create a color
   format that represents all colors.

## Hardware ##

Not provided.