part of dhatcell;


class Vec3 extends Vec {
  
  double x, y, z;

  Vec3(this.x, this.y, this.z) {

  }

  Vec3.fromList(List<double> list) {
    x = list[0];
    y = list[1];
    z = list[2];
  }

  Vec3.copy(Vec2 other) {
    x = other.x;
    y = other.y;
    z = other.z;
  }

  int dim() => 3;
  double length() => sqrt(x * x + y * y + z * z);
  bool zero() => x == 0 && y == 0 && z == 0;
  List<double> toList() => [x, y, z];
  Float32List toTypedList() => new Float32List.fromList(toList());
  void asUniformGL(UniformLocation location) => GL.uniform3f(location, x, y, z);

  Vec3 addVec(Vec3 other) {
    x += other.x;
    y += other.y;
    z += other.z;
    return this;
  }

  Vec3 subVec(Vec3 other) {
    x -= other.x;
    y -= other.y;
    z -= other.z;
    return this;
  }

  Vec3 mulVec(Vec3 other) {
    x *= other.x;
    y *= other.y;
    z *= other.z;
    return this;
  }

  Vec3 divVec(Vec3 other) {
    x /= other.x;
    y /= other.y;
    z /= other.z;
    return this;
  }

  Vec3 mulScalar(double scalar) {
    x *= scalar;
    y *= scalar;
    z *= scalar;
    return this;
  }

  Vec3 norm() {
    return mulScalar(1.0 / length());
  }

}