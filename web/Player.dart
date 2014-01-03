part of dhatcell;


class Player {
  
  Geom geom;
  ShaderProgram program;

  void initGL() {
    program = new ShaderProgram();
    program.initGL(player_vert, player_frag);
    
    geom = new Geom();
    geom.initGL(program.program, {"vert_position" : 4});
    geom.vData.addAll([-0.5, -0.5, 0.0, 1.0]);
    geom.vData.addAll([-0.5, 0.5, 0.0, 1.0]);
    geom.vData.addAll([0.5, 0.5, 0.0, 1.0]);
    geom.vData.addAll([0.5, -0.5, 0.0, 1.0]);

    geom.iData.addAll([0, 1, 2, 2, 3, 0]);
    geom.uploadGL();
}

  void drawGL(double delta) {
    geom.bindGL();
    program.bindGL();
    GL.viewport(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    geom.drawGL();
    program.unbindGL();
    geom.unbindGL();
 }

}