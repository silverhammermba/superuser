---
layout: chapter
title: Selected Exercise Answers
---

<!-- TODO dynamically insert TOC here -->

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
2. 2843<sub>9</sub> = 2145<sub>10</sub>, 3A02<sub>13</sub> = 8283<sub>10</sub>
3. The trick is to look at columns. The rightmost column alternates 010101...,
   the next alternates in twos 00110011.., the next in fours 000011110000...,
   and so on.
4. Not provided.
5. Hexadecimal digits correspond to quadruplets of binary digits, and octal
   digits correspond to triplets of binary digits. Note that 16 = 2<sup>4</sup>
   and 8 = 2<sup>3</sup>. From there you should be able to figure out what the
   tricks are for converting between base 3 and base 9 or base 6 and base 36,
   etc.

## Formatting ##

1. The simplest format for storing negative numbers is to devote the first bit
   to storing the sign of the number (e.g. 0 for positive, 1 for negative). How
   would you use this format? What sort of algorithm would you need to make in
   order to perform arithmetic with positive and negative numbers?

   Actual computers use a much more clever format called "two's complement". This
   format takes advantage of modular arithmetic to represent negative numbers in a
   way so that you can add, subtract, and multiply them using the _same_
   algorithm you use for positive numbers!
   {: .deeper}

   One format for storing decimal numbers would be to use two bytes X and Y.
   Then each number is defined as X &times; 10<sup>Y</sup>. That way X and Y can
   be normal integers, but by making Y negative we can represent small numbers
   e.g. X = 205, Y = &minus;2, 205 &times; 10<sup>&minus;2</sup> = 2.05.

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

Here's a computer I recently built to use as a home media center and server.

* Case: Fractal Design Node 304
* Motherboard: MSI B85I Intel Motherboard
* CPU: Intel Core i5-4570S
* RAM: G.SKILL Ares DDR3-1600 (2x8GB)
* SSD: Samsung 840 Pro MZ-7PD 128GB
* HDD: Western Digital 2TB Green (x2)
* Power supply: Rosewill SilentNight-500

Notice the ridiculous, confusing names for everything. Every computer is
different and this one was built with a very specific idea in mind:

* The case is exceptionally small, letting it fit under my TV next to my Blu-Ray
  player
* The CPU is a special low power model - usually found in laptops - which
  requires less cooling than a usual CPU. The CPU can also act as a decently
  powerful GPU, removing the need for a separate expensive, power-hungry,
  overheated GPU
* With 16GB total in RAM, the computer can run a lot of programs at once
  without slowing down
* The three hard drives (one SSD, two HDDs) make the computer very versatile.
  Programs can be stored on the SSD, making the computer start very quickly.
  Data like music and movies are duplicated and stored on each HDD. If one HDD
  breaks, no data will be lost. The "green" HDDs are also especially power
  efficient - turning themselves off when not in use
* The power supply is exceptionally quiet while still providing a large amount
  of power. This will make it easy to add more power-hungry components to the
  computer later if I decide to upgrade

The end result is a small, quiet computer that draws very little electricity!

## Part 2: The Internet ##

1. For the first protocol, the most data we could send is
   2<sup>4&times;8</sup>&minus;1=4,294,967,295 bytes. For the second protocol, each
   packet can hold 14 bytes of data. Each packet needs a unique packet number,
   so we can have at most 255 of them (the first packet isn't used to send
   data). That's 255&times;14=3,570 bytes total.

   <div>
   How can we make the first protocol capable of sending more data without
   increasing the number of bytes used to store the data size?

   How can we make the second protocol capable of sending more data without
   increasing the number of bytes used to store the packet number?
   </div>
   {: .deeper}

2. Here are some new challenges of this situation:

   * Both Alice and Bob will be sending, receiving, and ACKing messages. How
     will they differentiate a message and an ACK?
   * Messages are broken into small packets, but packets are subject to delays.
     What if one person sends two messages back-to-back, and the packets end up
     intermingled on the receiver's end? What if all of the packets of the
     second messages arrive before any of the packets of the first?
   * If Alice and Bob are to have a conversation, the order of messages is
     important. What if Bob sends Alice two messages back-to-back and Alice
     responds after only receiving the first message? How will Bob get the
     correct order of messages on his end?

   <div>
   If you are very forward-thinking, you might have also considered the
   challenge of _privacy_. If Alice is simply sending Bob a book, who cares if
   it is accidentally delivered to someone else? But what if Alice and Bob are
   discussing their super-secret computer enthusiast club? How can they stop
   their clandestine correspondence from falling into the wrong hands?

   This is an incredibly important topic, but one which we will tackle much
   later.
   </div>
   {: .deeper}

## Layers ##

Not provided.

## HTTP ##

1. Using ASCII is easy!

   I'm not taunting you, that's what it says.

2. Not provided.
3. Here's my approach. Since HTML is about the meaning of text, there is rarely
   a single correct HTML version of plain text. Different interpretations can
   lead to different valid results.

<!-- TODO not inside li, but whatever -->
{% highlight html %}
<!DOCTYPE html>
<html>
  <head><title>My favorite recipe</title></head>
  <body>
    <h1>Pesto</h1>
    <p>
      This family recipe is simple, yet I have rarely tasted a
      restaurant's pesto that bested it.
    </p>
    
    <h2>Ingredients</h2>
    <ul>
      <li>2/3 cup basil leaves (approx.)</li>
      <li>1/3 cup olive oil</li>
      <li>1/3 cup parmesan cheese</li>
      <li>2 tbsp pine nuts or walnuts</li>
      <li>1/8 tsp (white) pepper</li>
      <li>2-3 cloves garlic</li>
    </ul>
    
    <h2>Directions</h2>
    <ol>
      <li>Put all ingredients in blender</li>
      <li>Blend</li>
    </ol>
    <p>Serves 4-6</p>
  </body>
</html>
{% endhighlight %}

## The Browser ##

Not provided.

## Security ##

1. The plaintext is "ENUMERATE BY COLUMN"
2. The key is 18 and the plaintext is "CRACKED". Do you see how the answer to
   the previous exercise can help here?
3. The plaintext is "STILL BROKEN"
4. This one is tricky.

   The crucial flaw in substitution ciphers is letter frequency. In English (and
   every other language, for that matter), certain letters appear much more
   frequently than others. For English, the top three letters in order are E, T,
   A. Since every E is encrypted to the same letter, it's usually a reasonable
   assumption that the most frequent letter in your ciphertext decrypts to E,
   the next most frequent to T, etc.

   After you make a few letter guesses, the next flaw to exploit is that
   substitution ciphers leave letter patterns in words unaffected. For example,
   suppose you see the word "XUXXGUSX" in your ciphertext. This could decrypt to
   any one of the 30 thousand English words that are eight letters long; or can
   it? We know that all of the Xs decrypt to the same letter, so we're looking
   for an English word that's eight letters long where the first, third, fourth,
   and eigth letters are all the same. From almost 30,000 words that narrows the
   list down to 8. Add in the requirement that the second and sixth letters have
   to match (because of the U) and we get just one possibility: GIGGLING.

   The general problem with substitution ciphers is that guessing a little bit
   of the key correctly makes it easier to guess the rest of the key correctly.
   This makes it much less secure than the 4 septillion keys might make you
   believe.

   Now how about cracking that encrypted paragraph?
5. 0x1848
6. Again, we can stop once the first five bits are the same as the last five,
   since it will repeat.

       110011010010000101011101100011111001
