part of dhatcell;


class Vec4 extends Vec {
  
  double x, y, z, w;

  Vec4(this.x, this.y, this.z, this.w) {

  }

  Vec4.fromList(List<double> list) {
    x = list[0];
    y = list[1];
    z = list[2];
    w = list[3];
}

  Vec4.copy(Vec2 other) {
    x = other.x;
    y = other.y;
    z = other.z;
    w = other.w;
  }

  int dim() => 4;
  double length() => sqrt(x * x + y * y + z * z + w * w);
  bool zero() => x == 0 && y == 0 && z == 0 && w == 0;
  List<double> toList() => [x, y, z, w];
  Float32List toTypedList() => new Float32List.fromList(toList());
  String toString() => "($x | $y | $z | $w)";
  void collect(List<double> list) => list.addAll([x, y, z, w]);
  void asUniformGL(UniformLocation location) => GL.uniform4f(location, x, y, z, w);

  Vec4 addVec(Vec4 other) {
    x += other.x;
    y += other.y;
    z += other.z;
    w += other.w;
    return this;
  }

  Vec4 subVec(Vec4 other) {
    x -= other.x;
    y -= other.y;
    z -= other.z;
    w -= other.w;
    return this;
  }

  Vec4 mulVec(Vec4 other) {
    x *= other.x;
    y *= other.y;
    z *= other.z;
    w *= other.w;
    return this;
  }

  Vec4 divVec(Vec4 other) {
    x /= other.x;
    y /= other.y;
    z /= other.z;
    w /= other.w;
    return this;
  }

  Vec4 mulScalar(double scalar) {
    x *= scalar;
    y *= scalar;
    z *= scalar;
    w *= scalar;
    return this;
  }

  Vec4 norm() {
    return mulScalar(1.0 / length());
  }

}