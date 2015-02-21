---
layout: chapter
title: Glossary
---

<div id="links"></div>

Algorithm
: A well-defined, step-by-step process.

Analog
: Information which can be perfectly represented only by continuous data.

Application layer
: The protocol underneath the transport layer which communicates the actual
  information. HTTP is the most famous example.

BIOS
: Basic Input/Output System.
: Simple programs stored in the motherboard which initiate other hardware and
  prepare the computer to run more complicated programs.

Bit
: A binary digit.

Byte
: Eight bits.

CA
: Certificate Authority
: A trustworthy, neutral third party which verifies others' identities in order
  to pass that trust on to users (using inherited trust).

Checksum
: A function that accepts any number of bytes as input and outputs a fixed
  number of bytes as output.

Cipher
: Encryption
: Sometimes called a "code" by the layperson.
: A data format which can only be decoded/encoded (decrypted/encrypted) using a
  key.

Ciphertext
: Encrypted data produced by using a cipher on some plaintext.

Computation
: A function that can be evaluated using an algorithm.

Continuous
: Describes data which can only be measured.

CPU
: Central Processing Unit
: The heart of a modern computer, which reads program instructions and performs
  computations using the data in its registers

Cryptanalysis
: The study of ciphers for the purpose of extracting key or plaintext from
  ciphertet

Data
: Fact. Truth. Can be interpreted to produce information.

Decryption
: The process of producing plaintext from ciphertext (usually using the key).

Digest
: The output of a hash function

Digital
: Information which can be perfectly represented using discrete data.

Discrete
: Describes data which can be counted.

Encryption
: The process of producing ciphertext from plaintext.

Evaluate
: For a function, to determine its output given input.

Format
: A description of how bytes are grouped together and what certain bytes or byte
  values mean.

Freeware
: Software which is completely free but not open source.

Function
: A relation between input and output, where each input has at most one output.

GPU
: Graphics Processing Unit
: The component of a computer dedicate to computing the images displayed on the
  monitor.

Hardware
: The physical components of a computer.

Hash
: A function which takes an arbitrary number of bytes as input and outputs a
  fixed numbers of bytes
: The output of a hash function

HDD
: Hard disk drive
: The computer component for storing large amounts of data, even while the
  computer is off. Performs the same function as an SSD.

HTML
: HyperText Markup Language
: The textual language that describes the contents of a web page

HTTP
: HyperText Transfer Protocol
: An application protocol which allows transmission of web pages and multimedia

HTTPS
: HTTP Secure
: The practice of wrapping the HTTP protocol in an additional layer of TLS.

Information
: Meaning. Can be encoded/stored as data using an appropriate format.

Inherited Trust
: The idea that if Alice trusts Bob and Bob trusts Charlie, then Alice should
  trust Charlie. Used by HTTPS to trust websites via certificate authorities.

Internet layer
: The protocol in charge of getting data from one computer to another. In most
  cases, this is the Internet protocol (IP)

IP address
: A number uniquely representing a computer on a network for use with the
  Internet protocol. Most commonly 4 bytes long, though newer addresses have 16
  bytes.

Key
: For ciphers, the piece of data used to encrypt/decrypt the plaintext.

Layer
: A protocol that allows for transmission of arbitrary data.

Malware
: Malicious software that does something bad to your computer

Monitor
: The screen of a computer, which displays images using pixels.

Motherboard
: Mobo
: The computer component that all other components connect to. Includes the BIOS
  and allows different components to communicate.

Nibble
: Four bits.
: Half of a byte.

NIC
: Network interface controller
: The component of a computer dedicated to sending/receiving signals over a
  network. Often included as a part of the motherboard.

Open Source
: Used to describe software that is developed transparently in the public, often
  with community support

Packet
: A format that wraps other formats, allowing additional information to be
  attached to the contained data.

PCI
: PCIe
: Periperhal component interconnect express
: The standardized connection used by complex computer components such as the
  GPU.

Pixel
: A (small) square of solid color. Used to represent images digitally as on a
  monitor.

Plaintext
: The plain old data which ciphers protect. Produced by decrypting ciphertext.

Program
: An algorithm that is read and performed by a computer.
: Software.

Protocol
: Defines rules for exchanging messages between computers, including data
  formats that will be used.

Programming
: The process of inputting a program into a computer for it to read.

Public-Key Cipher
: A cipher that uses different keys for encrypting and decrypting (so one key
  can be made public).

Psuedorandom Numbers
: Numbers that "look" random and unpredictable, but which are actually produced
  in a non-random way.

PRNG
: PsuedoRandom Number Generator
: A function which can be used to produce psuedorandom numbers.

RAM
: Random Access Memory
: The computer component that stores most of the information needed while the
  computer is running. Larger and slower than the CPU cache, but smaller and
  faster than the hard drive.

Salt
: For passwords, the practice of adding random information to a password prior
  to hashing so that duplicate passwords still have different hashes.

Secure (Encryption)
: A decryption key is secure if it would take so long to guess the key (using a
  computer) that the plaintext would be worthless by the time it is recovered.

Shareware
: Software which is free but limited in some way until you pay for the "full
  version".

Software
: A program or programs.

Sound card
: The component of a computer dedicated to computing the audio signals sent to
  the speakers. Often included as a part of the motherboard in simpler
  computers.

SSD
: Solid state drive
: A modern alternative to an HDD which has no moving parts, is smaller, and uses
  less electricity.

Stream Cipher
: A cipher that can encrypt/decrypt each bit of data independently of the others

Symmetric-Key Cipher
: A cipher that uses the same key for encrypting and decrypting.

TLS
: Transport Layer Security
: An application protocol which both verifies the identities of the communicating
  parties and encrypts the data to prevent eavesdropping.

Transport Layer
: The protocol in charge of packaging data for transmission and unpacking it
  afterwards. TCP and UDP are protocols that are often used for this layer.

Turing complete
: The ability for a machine to simulate a Turing machine (and thus perform any
  calculation). A machine is a computer if and only if it is Turing complete.

Turing machine
: A simple, theoretical computer.

USB
: Universal serial bus
: The standardized connection used by many simple computer periphals such as
  mice, keyboards, webcams, etc.

<script>
window.onload = function() {
    var defs = $('dt');
    var i = 0;

    // add links to letters
    for (var letter = 'A'; letter <= 'Z'; letter = String.fromCharCode(letter.charCodeAt(0) + 1)) {
        $('#links').append('<a href="#' + letter + '">' + letter + '</a>');
        if (letter < 'Z')
            $('#links').append(' - ');

        while ($(defs[i]).text()[0] < letter) {
            ++i;
        }

        if ($(defs[i]).text()[0] === letter) {
            $(defs[i]).attr('id', letter);
        }
    }
}
</script>
