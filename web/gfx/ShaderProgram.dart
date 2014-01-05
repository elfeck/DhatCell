part of dhatcell;


class ShaderProgram {

  Program program;
  Shader vert, frag;
  Map<UniformLocation, Uniform> uniforms;

  ShaderProgram() {
    uniforms = new Map<UniformLocation, Uniform>();
  }

  void initGL(String vertSrc, String fragSrc) {
    vert = GL.createShader(VERTEX_SHADER);
    GL.shaderSource(vert, vertSrc);
    GL.compileShader(vert);
    if (!GL.getShaderParameter(vert, COMPILE_STATUS)) { 
      print("Error in compileShader (vert): " + GL.getShaderInfoLog(vert));
    }
    frag = GL.createShader(FRAGMENT_SHADER);
    GL.shaderSource(frag, fragSrc);
    GL.compileShader(frag);
    if (!GL.getShaderParameter(frag, COMPILE_STATUS)) { 
      print("Error in compileShader (frag): " + GL.getShaderInfoLog(frag));
    }
    program = GL.createProgram();
    GL.attachShader(program, vert);
    GL.attachShader(program, frag);
    GL.linkProgram(program);
    if (!GL.getProgramParameter(program, LINK_STATUS)) { 
      print("Error in linkProgram: " + GL.getProgramInfoLog(program));
    }  
  }

  void bindGL() {
    GL.useProgram(program);
    uniforms.forEach((loc, uni) => uni.asUniformGL(loc));
  }

  void unbindGL() {
    GL.useProgram(null);
  }

  void addUniformGL(String name, Uniform uniform) {
    uniforms.putIfAbsent(GL.getUniformLocation(program, name), () => uniform);
  }

}