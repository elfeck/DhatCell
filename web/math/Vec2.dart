part of dhatcell;


class Vec2 extends Vec {
  
  double x, y;

  Vec2(this.x, this.y) {

  }

  Vec2.fromList(List<double> list) {
    x = list[0];
    y = list[1];
  }

  Vec2.copy(Vec2 other) {
    x = other.x;
    y = other.y;
  }

  int dim() => 2;
  double length() => sqrt(x * x + y * y);
  bool zero() => x == 0 && y == 0;
  List<double> toList() => [x, y];
  Float32List toTypedList() => new Float32List.fromList(toList());
  String toString() => "($x | $y)";
  void collect(List<double> list) => list.addAll([x, y]);
  void asUniformGL(UniformLocation location) => GL.uniform2f(location, x, y);

  Vec2 add(double xx, double yy) {
    x += xx;
    y += yy;
    return this;
  }

  Vec2 addVec(Vec2 other) {
    x += other.x;
    y += other.y;
    return this;
  }

  Vec2 sub(double xx, double yy) {
    x -= xx;
    y -= yy;
    return this;
  }

  Vec2 subVec(Vec2 other) {
    x -= other.x;
    y -= other.y;
    return this;
  }

  Vec2 mul(double xx, double yy) {
    x *= xx;
    y *= yy;
    return this;
}

  Vec2 mulVec(Vec2 other) {
    x *= other.x;
    y *= other.y;
    return this;
  }

  Vec2 div(double xx, double yy) {
    x /= xx;
    y /= yy;
  }

  Vec2 divVec(Vec2 other) {
    x /= other.x;
    y /= other.y;
    return this;
  }

  Vec2 mulScalar(double scalar) {
    x *= scalar;
    y *= scalar;
    return this;
  }

  Vec2 norm() {
    return mulScalar(1.0 / length());
  }

}