## My first code
using Gadfl
## Probando
a = 3+2
import Gadfly: plot
methods(+) # methods for sum
supertype(Float64) # supertype of Float64
subtypes(Integer) # subtypes of Integer
typeof(a) # type of a
# determine type of elements in collection a
eltype(a)
#You can fix the type a variable with the operator :: (read as “is an instance of”):
a::Float64 # fixes type of a to generate type-stable code
b::Int = 10 # fixes type and assigns a value

sizeof(a) # Size memory

#If you want to know more about the state of your memory at any given time, you can check the workspace in JuliaPro or type
varinfo()

# No clear workspace
a = 0
#or
GC.gc() # garbage collector

#Julia’s sophisticated type structure provides you with extraordinary capabilities. For instance, you can use a greek letter as a variable by typing its LATEX’s name plus pressing
#(\alpha (+ press Tab) = 3)
α = 3
☎ = 2
α + 🐳
pi
ℯ
typeof(pi)
a = 1 //2
b = 3 //7
c = a + b
numerator(c)
denominator(c)

# Julia reduce a rational if numerator and denominator have common factors

a = 15//9
a = 1//0
a = 0//0
# Si quieres transfrormar un racionañ devuelta a float, solo tienes que escribir
float(c)

# Y para un racional hacia un Float64
# approximate representation of the float, the return that you expect
rationalize(1.20)
# exact representation of the float, perhaps not the return that you expect
Rational(1.20)

## Variables
a = 3 # integer
b = 0x3 # unsigned integer, hexadecimal base
c = 0b11 # unsigned integer, binary base
d = 3.0 # Float64
e = 4 + 3im # imaginary
f = complex(4,3) # same as above
g = true # boolean
h = "String" # string


#You can check the minimum and maximum value every type can store with the functions
#typemin() and typemax() , the machine precision of a type with eps() and, if it is a floating point, the effective bits in its mantissa by precision() . For example, for a Float64

typemin(Float64) # returns -Inf (just a convention)
typemin(Float64) # returns Inf (just a convention)
eps(Float64) # returns 2.22e-16
precision(Float64) # returns 53

#Larger or smaller numbers than the limits will return an overflow error. You can also check the binary representation of a value:

a = 1
bitstring(a) # binary representation of a

#Although, as mentioned above, Julia will take care of converting types automatically most of the times, in some occasions you may want to convert and promote among types explicitly:

convert(Float32,a) # convert variable x to a type T
Float32(a) # same as above

promote(1, 1.0) # promotes both variables to 1.0, 1.0

#You can define your own types, conversions, and promotions. As an example of a user-defined conversion:
convert(::Type{Bool}, x::Real) = x<=10.0 ? false : x>10.0 ? true : throw(
InexactError())

#converts a real to a boolean variable following the rule that reals smaller or equal than 10.0 are false and reals larger than 10.0 are true. Any other input (i.e., a rational), will throw an error. [TBC].

#Some common manipulations with variables include:
eval(a) # evaluates expression a in a global scope
real(a) # real part of a
imag(a) # imaginary part of a
reim(a) # real and imaginary part of a (a tuple)
conj(a) # complex conjugate of a
angle(a) # phase angle of a in radians
cis(a) # exp(i*a)
sign(a) # sign of a

round(a) # rounding a to closest floating point natural
ceil(a) # round up
floor(a) # round down
trunc(a) # truncate toward zero
clamp(a,low,high) # returns a clamped to [a,b]
mod2pi(a) # module after division by 2\pi
modf(a) # tuple with the fractional and integral part of a

## Operaciones aritmeticas
+ - * / ^ # arithmetic operations
+. -. *. /. ^. # element-by-element operations (for vectors and matrices)
// # division for rationals that produces another rational
+a # identity operator
-a # negative of a
a+=1 # a = a+1, can be applied to any operator
a\b # b/a
div(a,b) # a/b, truncated to an integer
cld(a,b) # ceiling division
fld(a,b) # flooring division
rem(a,b) # remainder of a/b
mod(a,b) # module a,b
mod1(a,b) # module a,b after flooring division
gcd(a,b) # greatest positive common denominator of a,b
gcdx(a,b) # gcd of a and and and their minimal Bezout coefficients
lcm(a,b) # least common multiple of a,b
min(a,b) # min of a and (can take as many arguments as desired)
max(a,b) # max of a and (can take as many arguments as desired)
minmax(a,b) # min and max of a and b (a tuple return)
muladd(a,b,c) # a*b+c

#Note, in particular, the use of the . to vectorize an operation (i.e., to apply an operation to a vector or matrix instead of an scalar). While Julia does not require vectorized code to achieve high performance (this is delivered through multiple dispatch and JIT compilation), vectorized code is often easier to write, read, and debug.

# Julia also accepts the alternative notation
+(a,b)

# for all standard operators (arithmetic, logical, and boolean). This is the form the function sum will appear in the documentation and it useful for long operations:
+(a,b,c,d,e,f,g,h,i)

x = 3
7*x # this delivers 21
7x # this also delivers 21
x7 # this delivers an error message (UndefVarError: x7 not defined)

a = true
b = false
c = 1.0
a+c # this delivers 2.0
b+c # this delivers 1.0
a*c # this delivers 1.0
b*c # this delivers 0.0

## Logical operators
! # not
&& # and
|| # or
== # is equal?
!== # is not equal?
=== # is equal? (enforcing type 2===2.0 is false
> # bigger than
>= # bigger or equal than
< # less than
<= # less or equal than

# Difference between == and ===
b+c == a*c
b+c === a

#Logical operators can be linked with as much depth as desired:
3 > 2 && 4<=8 || 7 < 7.1

2 > 3 && println("I am lazy")

#On the other hand, Julia does not use memoisation (i.e, storing the returns of a function for some inputs to return them when the same inputs are called again). You can always implement a short-cut memoisation by pre-computing some returns of a function that you know you may need to use repeatedly and storing them in an array

## Boolean operators
~ # bitwise not
& # bitwise and
| # bitwise or
xor # bitwise xor (also typed by \xor or \veebar + tab)
>> # right bit shift operator
<< # left bit shift operator
>>> # unsigned right bit shift operator

## Matematical functionons
abs(a) # absolute value of a
abs2(a) # square of a
sqrt(a) # square root of a
isqrt(a) # integer square root of a
cbrt(a) # cube root of a
exp(a) # exponent of a
exp2(a) # power a of 2
exp10(a) # power a of 10
expm1(a) # exponent e^a-1 (accurate)
ldexp(a,n) # a*(2^n) (a needs to be Float)
log(a) # log of a
log2(a) # log 2 of a
log10(a) # decimal log of a
log(50,a) # log base n of a
log1p(a) # log of 1+a (accurate)
lfact(a) # logarithmic factorial of a

deg2rad(a) # degrees to radians
rad2deg(a) # radians to degrees
sin(a) # sine of a in radians
sind(a) # sine of a in degrees
sinpi(a) # sine of pi*a (more accurate than sin(pi*a)
sinc(a) # (sine of pi*a)/(pi*a)
asin(a) # inverse sine of a in radians
asind(a) # inverse sine of a in degrees
sinh(a) # hyperbolic sine of a
asinh(a) # inverse hyperbolic sine of abstract type a

cos(a) # cosine of a
tan(a) # tangent of a
sec(a) # secant of a
csc(a) # cosecant of a
cot(a) # cotangent of a
hypot(a,b) # hypotenuse of a and b

# Combinatorial
factorial(a) # factorial of a
binomial(a,b) # choosing b out of a items

#Productorials
nextpow(a,b) # next power of a equal or after b
prevpow(a,b) # previous power of a equal or after b
# next integer equal or bigger than c that is a product of a and b
nextprod([a, b], c)

# are 1.0 and 1.1 the same with a tolerance level of 0.1?
isapprox(1.0, 1.1; atol = 0.2) # returns true
!isapprox(1.0, 1.1; atol = 0.2) # returns false
# are 1.0 and 1.1 the same with a tolerance level of 0.01?
isapprox(1.0, 1.1; atol = 0.01) # returns false
!isapprox(1.0, 1.1; atol = 0.01) # returns true

#isapprox(1.0, 1.1;atol = 0.01,norm::mynorm)
#We will discuss below how to define a function mynorm However, the default for scalars will be to take the absolute difference.

## Arrays

#An array is an ordered collection of objects stored in a multi-dimensional grid. For example, an abstract 2 × 2 array of floats can be created with the simple constructor

a  = Array{Float64}(undef,2,2)

a = ["Economics" 2 ;
    3.1  true]

# Component a[1,1] is a string  a[1,2]
a[1,1]
a[1,2] # Integrer
a[2,1] #Float
a[2,2] # boolean

a = Array{Float64}(undef, 2,2,2)

ndims(a) # number of dimensions of a
size(a) # size of each dimension of a
length(a) # length (factor of the sizes) of a
axes(a) # axes of a

a = Array{Float64}(undef,2,2,2)
#You can build a similar array to another one already existing with a different type
b = similar(a,Int)

# Change together
a = ["My string" 2; 3.1 true]
b = a
a[1,1] = "Example of passing by reference"
b[1, 1]

# This can be easily checked by the typing
pointer_from_objref(a)
pointer_from_objref(b)
#In the fieldnames(structName)

# If you want to be sure that B is not changed when a changes, you can use copy()
a = ["My string" 2; 3.1 true]
b = copy(a)
a[1,1] = "Example of passing by reference"
b[1, 1]
# returns My string

#In addition to copy() , Julia has a deepcopy() function. While copy() does not change possible references to other objects within the array (for example, an array inside the array and which is still passed by reference), deepcopy() does. For example

a = [1 2 3]
b = ["My String", a]
c = copy(b)
d = deepcopy(b)
a[1] = 45
c[2] # results 45 2 3
d[2] # results 1 2 3

## vectors

# The definition of vectors in Julia is straightforward:
a = [1, 2, 3] # vector
a = [1; 2; 3] # same vector
# Both instructions create an array{Int64, 1} , or its alias Vector{Int64} . However, you must note that:
b = [1 2 3] # 1x3 matrix (i.e., row vector)
b = [1 2 3]' # 3x1 matrix (i.e., column vector)

#generate an 1 × 3 array{Int64, 2} (i.e., 1 × 3 matrix) and an 3 × 1 array{Int64, 2} (i.e., 3 × 1 matrix), or its alias Matrix{Int64} . Therefore:

a = [1, 2, 3]
b = [1 2 3]
a == b


# faster command to created vectors is collect() :
a = collect(1.0:0.5:4) # vector from 1.0 to 4.0 with step 0.

# Similarly, Julia has step range constructors
# a = i:n:j
i = 1.0
n = 0.5
j = 0.4
k = 8
a = i:n:j # list of points from i to j with step n
a = collect(a)
# linearly spaced list of k points (linspance in MATLAB)
a = range(1, 5, length=k)



# collect() is a generator that allows the use of general programming structures such as loops or conditionals as the ones we will see in Section 1.7:
collect(x for x in 1:10 if isodd(x))

#A related and versatile function is enumerate() , which returns an index of a collection
a = ["micro", "macro", "econometrics"]
a = ["micro", "macro", "econometrics"];
for (index, value) in enumerate(a)
println("$index $value")
end

enumerate(a)

show(a) # shows a
sum(a) # sum of a
maximum(a) # max of a
minimum(a) # min of a
a[end] # gets last element of a
a[end-1] # gets element of a -1

# short
a = [2,1,3]
sort(a) # sorts a
sort(a,by=abs) # sorts a by absolute values # indices of sort of a
#find the start and end
first(a) # returns 2
last(a) # returns 3

a = [2,1,3]
first(a) # returns 2
last(a) # returns 3
findall(isodd,a) # returns indices of occurrences (here 2,3)
findfirst(isodd,a) # returns first index of occurrence

#Note that we can check in any collection, including arrays, the presence of an elementwith the short yet powerful function in :
a = [1,2,3]
2 in a # returns true
in(2,a) # same as above
4 in a # returns false


# Edit Arrays
sort!(a) # sorts a and changes it
popfirst!(a) # eliminates first element of a
pushfirst!(a,c) # adds c as an additional element of a at its start
pop!(a) # eliminates last element of a
push!(a,c) # adds c as an additional element of a at its end

# To save space, we will not repeat the ! form of many of the functions that we will introduce in the next paragraphs, but you can check the documentation about them in case you want to use the version in your code.
## Set operations
a = [2,1,3]
b = [2,4,5]
union(a,b) # returns 2,1,3,4,5
intersect(a,b) # returns 2
setdiff(a,b) # returns 1,3
setdiff(b,a) # returns 4,5

## matrices
# More concrete examples of matrix commands (most of the commands for vectors will also apply to matrices):

a = [1 2; 3 4] # create a 2x2 matrix
a[2, 2] # access element 2,2
a[1, :] # access first row
a[:, 1] # access first column
a = zeros(2,2) # zero matrix
a = ones(2,2) # unitary matrix
a = fill(2,3,4) # fill a 3x4 matrix with 2's
a = trues(2,2) # 2x2 matrix of trues
a = falses(2,2) # 2x2 matrix of falses
a = rand(2,2) # random matrix (uniform)
a = randn(2,2) # random matrix (gaussian)

#r epeat a matrix to take advantage of some inner structure
a = [1 2; 3 4] # create a 2x2 matrix
# repeats matrix 2x3 times
b = repeat(a, 2,3)
B = copy(a)

#The basic operations with matrices are given by:
a' # complex conjugate transpose of a
a[:] # convert matrix a to vector
vec(a) # vectorization of a

a*B # multiplication of two matrices
a\B # solution of linear system ax = B

# Advanced operations with matrices:
inv(a) # inverse of a
pinv(a) # pseudo-inverse of a
rank(a) # rank of a
norm(a) # Euclidean norm of a
det(a) # determinant of a
trace(a) # trace of a
eigen(a) # eigenvalues and eigenvectors
tril(a) # lower triangular matrix of a
triu(a) # upper triangular matrix of a
rotr90(a,n) # rotate a 90 degrees n times
rot180(a,n) # rotate a 180 degrees n times
cat(i,a,b) # concatenate a and b along dimension i
a = [[1 2] [1 2]] # concatenate horizontally
hcat([1 2],[1 2]) # alternative notation to above
a = [[1 2]; [1 2]] # concatenate vertically
vcat([1 2],[1 2]) # alternative notation to above
a = diagm(0=>[1; 2; 3]) # diagonal matrix
a = reshape(1:10, 5, 2) # reshape
sort(a,1) # sorts rows lexicographically
sort(a,2) # sorts columns lexicographically
