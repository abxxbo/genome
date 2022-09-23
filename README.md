# genome
An esoteric programming language with 4 keywords.

# How to Compile
Run `make` (since genome is written in C).


# Keywords and what they do
| Keyword     | What it does|
| ----------- | ----------- |
| C           | Print ASCII representation of value at instruction pointer |
| T           | Increment value at instruction pointer |
| G           | Add 1 to current instruction pointer |
| A           | Decrement 1 to current instruction pointer |
| P           | Get one byte of input and store it at the current instruction pointer |
| O           | Loop until next occasion of `O`, `n` times (e.g. `O ... On`). See [Limitations on `O`](#limitations-on-o) |
|||
| t           | Decrement value a tinstruction pointer (inverse of `T`) |


# Examples
See `examples/`.

# Limitations on `O`
`n` must be `>1024`.

An example of using `O` is

*hello_loop.gn*:
```genome
OTO104CGOTO101CGOTO108CGACOTO111C
GOTO10C
```

*Shell*:
```
$ genome hello_loop.gn
hello
$
```