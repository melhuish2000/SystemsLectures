# A first example in x86-64
# This example uses AT&T Style syntax
# (Note, there are many other styles)
#
# In order to 'assemble' this program
# into an executable binary file
# here are the steps
#
# 1. gcc -c hello.s
# 2. ld hello.o -o hello
# 3. ./hello

# The .text section is where the actual
# code is stored.
.text

# .global tells us which label the program
# will start from (i.e. the program entry).
.global _start

# Anything that ends with ':' remember is
# a label.
_start:
    
    ## Write a message to the screen ##
    # In order to write a message to the
    # screen, we are going to use a 'syscall'
    # The correct 'function' in the kernel
    # will execute, based on what is 
    # in each register when 'syscall' is 
    # executed.
    mov $1, %rax
    mov $1, %rdi
    mov $message, %rsi
    mov $13, %rdx
    syscall

    ## Exit the program ##
    # This works similar to the above
    # There is something a little strange
    # with the xor %rdi, %rdi.
    # If you think about what that operation
    # is doing, it sets a specific value
    # in %rdi--think about it!
    mov $60, %rax
    xor %rdi, %rdi
    syscall

message:
    .ascii "Hello, World\n"
