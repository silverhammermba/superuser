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

Assembly language
: A human-readable version of machine code, used whenever programmers want to
  write CPU instructions by hand. An assembler program translates assembly into
  machine code.

Bash
: A popular shell/scripting language.

Basic input/output system
BIOS
: Simple programs stored in the motherboard which initiate other hardware and
  prepare the computer to run more complicated programs.

Binary blob
: A machine code program, especially when that program's source code was in a
  different language and was compiled to machine code.

Bit
: A binary digit.

Boot
: Short for bootstrap
: When a simpler program is used to run a more complicated program. The most
  common example is a boot loader running a kernel when a computer first turns
  on.
: To turn on a computer and run the essential OS programs.

Boot loader
: A simple program that simply runs a more complicated program, such as a
  kernel.

Byte
: Eight bits.

C
: An old, but wildly popular compiled procedural programming language.

Central processing unit
CPU
: The heart of a modern computer, which reads program instructions and performs
  computations using the data in its registers

Certificate authority
CA
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

Client
: A computer in a network that connects to a server to receive information
: A program that connects to a server

Command line
: A text interface for a human to type commands for a computer. Often synonymous
  with shell.

Compiler
: A program that translates a programming language into another (usually simpler)
  programming language.

Computation
: A function that can be evaluated using an algorithm.

Continuous
: Describes data which can only be measured.

Core dump
: A log of the CPU's memory and instructions at the time a program failed. Used
  by programmers to find the cause of the failure.

Cryptanalysis
: The study of ciphers for the purpose of extracting key or plaintext from
  ciphertext

Data
: Fact. Truth. Can be interpreted to produce information.

Decryption
: The process of producing plaintext from ciphertext (usually using the key).

Denial of service
DoS
: Deliberately flooding a web server with so many requests that other people
  cannot practically use it

Digest
: The output of a hash function

Digital
: Information which can be perfectly represented using discrete data.

Directory
: In a file system, a special type of file that contains no actual data but
  instead contains a list of other files for the purpose of organization.

Discrete
: Describes data which can be counted.

Driver
: The program instructions for interacting with a specific type of computer
  peripheral.

Encryption
: The process of producing ciphertext from plaintext.

Evaluate
: For a function, to determine its output given input.

Exit code
: The number that a program sends to the kernel when it finishes running.
  Usually indicates whether the program finished successfully.

File
: A chunk of data in a file system, usually including metadata about the file
  such as a name and a record of when the file was created or modified.

File path
: A sequence of file names describing the location of a particular file in a
  file system. Can be absolute (relative to the root of the file system) or
  relative (relative to the working directory).

File system
: A format for organizing data on a computer into chunks called files. Most
  commonly organizes files into a hierarchy of file directories.

Format
: A description of how bytes are grouped together and what certain bytes or byte
  values mean.

Freeware
: Software which is completely free but not open source.

Function
: A relation between input and output, where each input has at most one output.

Graphics processing unit
GPU
: The component of a computer dedicated to computing the images displayed on the
  monitor.

Hardware
: The physical components of a computer.

Hard disk drive
HDD
: The computer component for storing large amounts of data, even while the
  computer is off. Performs the same function as an SSD.

Hash
: A function which takes an arbitrary number of bytes as input and outputs a
  fixed numbers of bytes
: The output of a hash function

Hypertext markup language
HTML
: The textual language that describes the contents of a web page

Hypertext transfer protocol
HTTP
: An application protocol which allows transmission of web pages and multimedia

Hypertext transfer protocol secure
HTTPS
: The practice of wrapping the HTTP protocol in an additional layer of TLS.

Information
: Meaning. Can be encoded/stored as data using an appropriate format.

Inherited trust
: The idea that if Alice trusts Bob and Bob trusts Charlie, then Alice should
  trust Charlie. Used by HTTPS to trust websites via certificate authorities.

Input/Output
I/O
: The general term for when a computer reads data from or writes data to its
  peripherals

Interface
: The program instructions for the kernel for interacting with a general type of
  computer peripheral. A more abstract way of running the driver instructions.

Internet layer
: The protocol in charge of getting data from one computer to another. In most
  cases, this is the Internet protocol (IP)

Interpreter
: A program which reads program instructions and simulates the result of
  performing those instructions. Similar in many way to a VM.

IP address
: A number uniquely representing a computer on a network for use with the
  Internet protocol. Most commonly 4 bytes long, though newer addresses have 16
  bytes.

Kernel
: The main program run by a computer that manages the memory management and
  scheduling of other programs and which coordinates I/O usage through
  interfaces.

Key
: For ciphers, the piece of data used to encrypt/decrypt the plaintext.

Layer
: A protocol that allows for transmission of arbitrary data.

Machine code
: The binary instructions understood by the CPU.

Malware
: Malicious software
: Software that does something bad to your computer

Memory management
: Partitioning a computer's memory into separate segments so that different
  parts of memory can be used for different tasks simultaneously

Monitor
: The screen of a computer, which displays images using pixels.

Motherboard
Mobo
: The computer component that all other components connect to. Includes the BIOS
  and allows different components to communicate.

Network interface controller
NIC
: The component of a computer dedicated to sending/receiving signals over a
  network. Often included as a part of the motherboard.

Nibble
: Four bits.
: Half of a byte.

Object file
: Assembled machine code which is not a complete program. A link editor turns
  object files into a working program.

Open source
: Used to describe software that is developed transparently in the public, often
  with community support.

Operating system
OS
: A collection of programs that make a computer usable. These programs almost
  always include a kernel and boot loader.

Packet
: A format that wraps other formats, allowing additional information to be
  attached to the contained data.

Path
: See "file path"

Peer-to-peer
P2P
: A computer network where the computers act as both clients and servers,
  sharing data amongst themselves rather than relying on a central server

Peripheral component interconnect express
PCIe
PCI
: The standardized connection used by complex computer components such as the
  GPU.

Pixel
: A (small) square of solid color. Used to represent images digitally as on a
  monitor.

Plaintext
: The plain old data which ciphers protect. Produced by decrypting ciphertext.

Procedural programming
: A programming paradigm whereby a program is broken down into procedures where
  each procedure is a list of steps and procedures can run other procedures.

Program
: An algorithm that is read and performed by a computer.

Protocol
: Defines rules for exchanging messages between computers, including data
  formats that will be used.

Programming
: The process of inputting a program into a computer for it to read.

Programming paradigm
: A general way of breaking down problems such that they can be solved by a
  computer program.

Public-key cipher
: A cipher that uses different keys for encrypting and decrypting (so one key
  can be made public).

Psuedorandom numbers
: Numbers that "look" random and unpredictable, but which are actually produced
  in a non-random way.

Psuedorandom number generator
PRNG
: A function which can be used to produce psuedorandom numbers.

Random access memory
RAM
: The computer component that stores most of the information needed while the
  computer is running. Larger and slower than the CPU cache, but smaller and
  faster than the hard drive.

Read evaluate print loop
REPL
: Describes any program that first reads input from the user, performs some
  calculation using that input, prints the result of the calculation, and then
  loops back to the beginning to read more input.

Register
: Memory used by the CPU for performing calculations. Most CPUs have a variety
  of registers of different sizes, where different registers are specialized to
  certain computations.

Reverse engineering
: The process of recovering source code (or something similar) from a binary
  blob.

Ruby
: A relatively young scripting language which is popular among web developers
  for its simplicity and dynamism.

Salt (password)
: The practice of adding random information to a password prior to hashing so
  that duplicate passwords still have different hashes.

Scheduling
: Deciding in what order program instructions should be run when multiple
  programs are running simultaneously

Scripting language
: A programming language which is designed to be used with an interpreter.
  Sometimes called an "interpreted language".

Secure (encryption)
: A decryption key is secure if it would take so long to guess the key (using a
  computer) that the plaintext would be worthless by the time it is recovered.

Segmentation fault
: An error that indicates that the kernel noticed a program trying to access
  memory outside of its assigned segment, causing the kernel to immediately stop
  the program.

Server
: A computer in a network that waits for clients to connect in order to give
  them information

Shareware
: Software which is free but limited in some way until you pay for the "full
  version".

Shell
: A program which runs in a loop, providing an interface for running other
  programs with the kernel. Usually the first program that runs when a user logs
  in to an OS.

Software
: A program or programs. Usually used to refer to the program along with any
  additional data that is needed for regular use of the program (such as
  documentation or example input).

Sound card
: The component of a computer dedicated to computing the audio signals sent to
  the speakers. Often included as a part of the motherboard in simpler
  computers.

Source code
: The original program code with which a program was developed, especially when
  that code is later compiled into a different language.

Solid state drive
SSD
: A modern alternative to an HDD which has no moving parts, is smaller, and uses
  less electricity.

Stream cipher
: A cipher that can encrypt/decrypt each bit of data independently of the
  others.

Symmetric-key cipher
: A cipher that uses the same key for encrypting and decrypting.

Terminal
: Formerly a special device for entering commands for a computer and reading
  output, now synonymous with a shell.

Transport layer
: The protocol in charge of packaging data for transmission and unpacking it
  afterwards. TCP and UDP are protocols that are often used for this layer.

Transport layer security
TLS
: An application protocol which both verifies the identities of the communicating
  parties and encrypts the data to prevent eavesdropping.

Turing complete
: The ability for a machine to simulate a Turing machine (and thus perform any
  calculation). A machine is a computer if and only if it is Turing complete.

Turing machine
: A simple, theoretical computer.

Universal serial bus
USB
: The standardized connection used by many simple computer peripherals such as
  mice, keyboards, webcams, etc.

Virtual machine
VM
: A program that simulates running a real computer.

Working directory
: In a shell, the directory where all relative file paths are looked up

<script>
// get subsequent char
function succ(letter) {
    return String.fromCharCode(letter.charCodeAt(0) + 1);
}

window.onload = function() {
    var links = $('#links');
    var defs = $('dt');
    // @ comes before A
    var last_letter = '@';

    $('dt').each(function() {
        var next_letter = $(this).text()[0];
        // ignore incorrectly ordered defs
        if (next_letter <= last_letter) return;
        // fill in missing letters
        for (var letter = succ(last_letter); letter < next_letter; letter = succ(letter)) {
            links.append(letter + ' &ndash; ');
        }
        // add ref
        links.append('<a href="#' + next_letter + '">' + next_letter + '</a>');
        if (next_letter < 'Z') links.append(' &ndash; ');
        $(this).attr('id', letter);

        last_letter = next_letter;
    });
    // fill in rest of alphabet if we don't have Zs
    for (var letter = succ(last_letter); letter <= 'Z'; letter = succ(letter)) {
        links.append(letter);
        if (letter < 'Z') links.append(' &ndash; ');
    }
}
</script>
