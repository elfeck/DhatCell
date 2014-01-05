part of dhatcell;


class Mat extends Uniform {

  Float32List data;
  int dim;

  Mat(this.dim) {
    data = new Float32List(dim * dim);
  }

  Mat.fromList(List<double> list) {
    dim = sqrt(list.length);
    data = new Float32List.fromList(list);
  }

  void asUniformGL(UniformLocation location) {
    switch(dim) {
      case 2: GL.uniformMatrix2fv(location, false, data); break;
      case 3: GL.uniformMatrix3fv(location, false, data); break;
      case 4: GL.uniformMatrix4fv(location, false, data); break;
    }
  }

}