About this parabola solver whatchamacallit
------------------------------------------

This is a shaggy hunk of Ruby code I wrote for playing with basic quadratic
equations.

## parabola.rb

This contains a Ruby class, Parabola, that encapsulates the features of a basic
quadratic equation _a\*x^2 + b\*x + c_.  Objects can be instantiated by
providing the _a_, _b_, and _c_ coefficients directly:

    p = Parabola.new(2, 3, 4)

They can also be instantiated by providing a set of three Cartesian coordinates
all at once.  For example, to provide the coordinates [1, 1], [2, 3], and [7, 4]:

    p = Parabola.from_3_points(1, 1, 2, 3, 7, 4)
    # => #<Parabola:0x007fb71a91c020 @a=-0.3, @b=2.9, @c=-1.6>

Once instantiated, the object can be used to find any point on the curve given
_x_ or _y_:

    p.y_for_x(2) # => 2.9999999999999996
    p.x_for_y(4) # => [2.6666666666666665, 7.000000000000001]
    p.x_for_y(6) # => raises Math::DomainError

Note that `#x_for_y` returns an array of two values for _x_, which will always
be in increasing order.

This is what happens when you give two or three coordinates with the same _x_
value:

    p = Parabola.from_3_points(1, 1, 2, 8, 1, 3)
    # => #<Parabola:0x007fb719c50328 @a=-Infinity, @b=Infinity, @c=NaN>

## parabola\_solver.rb

This is just spaghetti code that I used to work out and check my work on the
math in `parabola.rb`.  It has little practical use, but I kept it.  It
generates random output that looks like this:

         x = 10
         y = -3
    
         a*x^2 + b*x + c = y
    (1)  a*100 + b*10 + c = -3
    
         x = -3
         y = -3
    
         a*x^2 + b*x + c = y
    (2)  a*9 + b*-3 + c = -3
    
         x = 3
         y = -7
    
         a*x^2 + b*x + c = y
    (3)  a*9 + b*3 + c = -7
    
    Subtracting (2) from (1) and (3) from (2) creates two new equations
    that eliminate c...
    
    (4)  a*91.0 + b*13.0 = 0.0
    
    (5)  a*0.0 + b*-6.0 = 4.0
    
    Solving for b in (4)...
    
         a*7.0 + b*1.0 = 0.0
    (6)  b = 0.0 + a*-7.0
    
    Then replacing b in (5)...
    
         a*0.0 + (0.0 + a*-7.0) * -6.0 = 4.0
         a*0.0 + -0.0 + a*42.0 = 4.0
         a*0.0 + a*42.0 = 4.0
         a*42.0 = 4.0
         a = 4.0 / 42.0
    (7)  a = 0.09523809523809523
    
    Use (6) to find b...
    
         b = 0.0 + 0.09523809523809523 * -7.0
    (8)  b = -0.6666666666666666
    
    Use (1) to find c...
    
         0.09523809523809523*100.0 + -0.6666666666666666*10.0 + c = -3.0
         9.523809523809524 + -6.666666666666666 + c = -3.0
         c = -3.0 - (9.523809523809524 + -6.666666666666666)
    (9)  c = -5.857142857142858

## Apologia

If this looks like the work of someone with a shaky grasp of basic algebra,
that's because it is.  The last time I remember playing with quadratic
equations was roughly three decades ago in my high school's "College Algebra"
course.

## Author

Lawrence Leonard Gilbert (2015-08-15)
