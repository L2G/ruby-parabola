# This is a "worksheet" I made for figuring out how to use Ruby to solve
# quadratic equations for any arbitrary set of three points on an arbitrary
# parabola.

points = [
  [rand(-10..10), rand(-10..10)],
  [rand(-10..10), rand(-10..10)],
  [rand(-10..10), rand(-10..10)]
]

x1 = points[0][0].to_f
y1 = points[0][1].to_f
x2 = points[1][0].to_f
y2 = points[1][1].to_f
x3 = points[2][0].to_f
y3 = points[2][1].to_f

points.each_with_index do |pair, n|
  (x, y) = pair
  puts "     x = #{x}"
  puts "     y = #{y}"
  puts
  puts "     a*x^2 + b*x + c = y"
  puts "(#{n+1})  a*#{x*x} + b*#{x} + c = #{y}"
  puts
end

puts "Subtracting (2) from (1) and (3) from (2) creates two new equations"
puts "that eliminate c..."
puts

f4_lh1 = x1**2 - x2**2
f4_lh2 = x1    - x2
f4_rh  = y1    - y2

puts "(4)  a*#{f4_lh1} + b*#{f4_lh2} = #{f4_rh}"
puts

f5_lh1 = x2**2 - x3**2
f5_lh2 = x2    - x3
f5_rh  = y2    - y3

puts "(5)  a*#{f5_lh1} + b*#{f5_lh2} = #{f5_rh}"
puts

puts "Solving for b in (4)..."
puts

puts "     a*#{f4_lh1/f4_lh2} + b*#{f4_lh2/f4_lh2} = #{f4_rh/f4_lh2}"
puts "(6)  b = #{f4_rh/f4_lh2} + a*#{0-(f4_lh1/f4_lh2)}"
puts

puts "Then replacing b in (5)..."
puts

puts "     a*#{f5_lh1} + (#{f4_rh/f4_lh2} + a*#{0-(f4_lh1/f4_lh2)}) * #{f5_lh2} = #{f5_rh}"
puts "     a*#{f5_lh1} + #{f4_rh/f4_lh2*f5_lh2} + a*#{0-(f4_lh1/f4_lh2*f5_lh2)} = #{f5_rh}"
puts "     a*#{f5_lh1} + a*#{0-(f4_lh1/f4_lh2*f5_lh2)} = #{f5_rh - f4_rh/f4_lh2*f5_lh2}"
puts "     a*#{f5_lh1 - (f4_lh1/f4_lh2*f5_lh2)} = #{f5_rh - f4_rh/f4_lh2*f5_lh2}"
puts "     a = #{f5_rh - f4_rh/f4_lh2*f5_lh2} / #{f5_lh1 -  f4_lh1/f4_lh2*f5_lh2}"
           a =  (f5_rh - f4_rh/f4_lh2*f5_lh2) /  (f5_lh1 -  f4_lh1/f4_lh2*f5_lh2)
puts "(7)  a = #{a}"
puts

puts "Use (6) to find b..."
puts

puts "     b = #{f4_rh/f4_lh2} + #{a} * #{0-(f4_lh1/f4_lh2)}"
           b =   f4_rh/f4_lh2  -   a  *     (f4_lh1/f4_lh2)
puts "(8)  b = #{b}"
puts

puts "Use (1) to find c..."
puts

x = x1
y = y1

puts "     #{a}*#{x*x} + #{b}*#{x} + c = #{y}"
puts "     #{a *  x*x} + #{b *  x} + c = #{y}"
puts "     c = #{y} - (#{a * x*x} + #{b * x})"
           c =   y  - (  a * x*x  +   b * x ) 
puts "(9)  c = #{c}"
puts
