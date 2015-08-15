class Parabola
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def self.from_3_points(in_x1, in_y1, in_x2, in_y2, in_x3, in_y3)
    x1 = in_x1.to_f
    x2 = in_x2.to_f
    x3 = in_x3.to_f
    y1 = in_y1.to_f
    y2 = in_y2.to_f
    y3 = in_y3.to_f

    f4_lh1 = x1**2 - x2**2
    f4_lh2 = x1    - x2
    f4_rh  = y1    - y2

    f5_lh1 = x2**2 - x3**2
    f5_lh2 = x2    - x3
    f5_rh  = y2    - y3

    a = (f5_rh - f4_rh/f4_lh2*f5_lh2) / (f5_lh1 - f4_lh1/f4_lh2*f5_lh2)
    b = f4_rh/f4_lh2 - a * (f4_lh1/f4_lh2)
    c = y1 - ( a * x1*x1  + b * x1 )
    p = new(a, b, c)
  end

  def y_for_x(in_x)
    x = in_x.to_f
    @a * x*x + @b * x + @c
  end

  def x_for_y(in_y)
    y = in_y.to_f
    sqrt_term = Math.sqrt(@b*@b + 4*@a*(y-@c))
    x1 = (0 - @b + sqrt_term) / (2*@a)
    x2 = (0 - @b - sqrt_term) / (2*@a)
    return [x1, x2].sort
  end
end
