# W. Richard Steven's sock program

This is a port of [W. Richard Steven's](https://www.wikiwand.com/en/W._Richard_Stevens)
"sock" program. This program is extensively used for exercises in his excellent
[TCP/IP Illustrated](https://www.amazon.com/TCP-Illustrated-Protocols-Addison-Wesley-Professional/dp/0321336313)
book (I don't make any money if you purchased this book, I'm just a fan).

The [original port of sock](http://ttcplinux.sourceforge.net/tools/tools.html)
was done by Mike Borella but didn't compile on my system (gcc 4.8.4+). I
fixed all the errors and warnings and used [GNU indent] (https://www.gnu.org/software/indent/manual/indent.html)
to reformat the source code consistently.

Please note that I *do not* hold the Copyright over this program. The program is copyrighted by Mr. Stevens, but
allowed free use as long as properly attributed (see the LICENSE) file for details.

## Compiling

To compile the program, just type:

```
$ ./configure
$ make
$ sudo make install
```

## Pull requests

Times change, and so do compilers and systems. If you manage to patch a problem
in this program, send me a pull request and I will incorporate it back into the
repository. I recommend using GNU indent to reformat your sources before
opening the pull request. The exact indent invocation used for this program
was:

```
indent --no-tabs --tab-size4 --indent-level4 --braces-on-if-line \
       --cuddle-else --braces-on-func-def-line --braces-on-struct-decl-line \
       --cuddle-do-while --no-space-after-function-call-names \ 
       --no-space-after-parentheses --dont-break-procedure-type *.c
```
