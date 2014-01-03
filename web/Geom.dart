part of dhatcell;


class Geom {

  List<double> vData;
  List<int> iData;
  Buffer vb, ib;
  int stride;

  Geom() : super() {
    vData = new List<double>();
    iData = new List<int>();
    stride = 0;
  }

  void initGL(Program program, Map<String, int> attribNames) {
    vb = GL.createBuffer();
    ib = GL.createBuffer();
    
    GL.bindBuffer(ARRAY_BUFFER, vb);
    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, ib);

    Map<int, int> locMap = new Map<int, int>();
    attribNames.forEach((name, size) => stride += size);
    attribNames.forEach((name, size) => locMap.putIfAbsent(
            GL.getAttribLocation(program, name), () => size));
    int offset = 0;
    for(int loc in locMap.keys.toList()..sort()) {
      setAttrib(loc, locMap[loc], offset);
      offset += locMap[loc];
    }
    GL.bindBuffer(ARRAY_BUFFER, null);
    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, null);
  }

  void uploadGL() {
    GL.bindBuffer(ARRAY_BUFFER, vb);
    GL.bufferDataTyped(ARRAY_BUFFER, new Float32List.fromList(vData), STATIC_DRAW);
    GL.bindBuffer(ARRAY_BUFFER, null);

    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, ib);
    GL.bufferDataTyped(ELEMENT_ARRAY_BUFFER, new Int16List.fromList(iData), STATIC_DRAW);
    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, null);
  }

  void updateGL() {
    
  }

  void bindGL() {
    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, ib);
  }

  void unbindGL() {
    GL.bindBuffer(ELEMENT_ARRAY_BUFFER, null);
  }

  void drawGL() {
    GL.drawElements(TRIANGLES, iData.length, UNSIGNED_SHORT, 0);
  }
  
  void setAttrib(int index, int size, int offset) {
    GL.enableVertexAttribArray(index);
    GL.vertexAttribPointer(index, size, FLOAT, false, stride * 4, offset * 4);
  }

}