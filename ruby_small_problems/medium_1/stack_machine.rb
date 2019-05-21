# A stack is a list of values that grows and shrinks dynamically.
# In ruby, a stack is easily implemented as an Array using #push and #pop.
# A stack-and-register program language uses a stack of values.
# Each operation in the language uses on a register, which can be thought of as
# the current value. The register is not part of the stack. Operations that
# require two values pop the topmost item from the stack (that is,
# the operation removes the most recently pushed value from the stack),
# perform the operation using the popped value and the register value,
# and then store the result back in the register.

# Instructions:
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value,
# storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value,
# storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value,
# storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value,
# storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value,
# storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# Ex:
# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

def minilang(input)
  stack = []
  register = 0
  input.split.each do |substring|
    case substring
    when 'ADD' then register += stack.pop
    when 'MULT' then register *= stack.pop
    when 'SUB' then register -= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PUSH' then stack << register
    when 'PRINT' then puts register
    else              register = substring.to_i
    end
  end
end

minilang('3 PUSH 15 DIV PRINT')
