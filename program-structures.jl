# Programming Structures

# Functions
# One-line
myfunction1(var) = var+1
# Several lines
function myfunction2(var1, var2="Float64", var3=1)
output1 = var1+2
output2 = var2+4
output3 = var3+3 # var3 is optional, by default var3=1
return [output1 output2 output3]
end

function myfunction3(var1, var2; keyword=2)
output1 = var1+var2+keyword
end

function myfunction3(var1::Int64, var2; keyword=2)
output1 = var1+var2+keyword
end

# To have several methods associated to a function, you only need to specify the type of the operands
function myfunction3(var1::Float64, var2; keyword=2)
output1 = var1/var2+keyword
end

#Note that there is full flexibility in the input return arguments. For example, one can have an empty argument
function myfunction4()
output1 = 1
end

#or return a function (this is called a higher-order function):

function myfunction5(var1)
    function myfunction6(var2)
        answer = var1+var2
        return answer
    end
    return myfunction6
end


# You can use the operator to fix the type fo a return
function myfunction2(var1)::Float64
return output1 = var1+1.0
end

# Anonymous functions
x ->x^2 # anonymous function
a = x ->x^2 # named anonymous function

# Arrays of functions
a = [exp, abs]

## Recursion, closures and currying
# Abstract functions allow for easy coding of advanced techniques such as recursion, closures, and currying. Recursion is a function that calls itself:
function outer(a)
    b = a + 2
    function inner(b)
        b = a + 3
    end
    inner(b)
end

# This is particularly useful for recursive computations, such as the canonical Fibonacci number example:
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)

# Closure
# Record storing a function. Closures allow for handling functions while keeping states hidden. This is known as continuation- passing style (in contrast with the direct style of standard imperative programming).

# We create a function that adds one
function counter()
    n = 0
    () -> n += 1
end

# we name it
addOne = counter()
addOne() # Produces 1
addOne() # Produces 2
addOne() # Produces 3

# Currying
# transforms the evaluation of a function with multiple arguments into the evaluation of a sequence of functions, each with a single argument:
function mult(a)
    return function f(b)
        return a*b
    end
end

# Note: Currying allows for easier reuse of abstract functions and to avoid determining parameters that are not required at the moment of evaluation
