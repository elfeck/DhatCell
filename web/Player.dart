part of dhatcell;


class Player {
  
  Geom geom;
  ShaderProgram program;
  
  Mat mvpMatrix;
  Vec2 offset;

  Player() {
    mvpMatrix = new Mat.fromList([
      1.0 / DISPLAY_WIDTH, 0, 0, 0,
      0, 1.0 / DISPLAY_HEIGHT, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1
    ]);
    offset = new Vec2(100, 100);
  }

  void initGL() {
    program = new ShaderProgram();
    program.initGL(player_vert, player_frag);
    program.addUniformGL("mvp_matrix", mvpMatrix);
    program.addUniformGL("offset", offset);
    
    geom = new Geom();
    geom.initGL(program.program, {"vert_position" : 4});
    geom.vData.addAll([-20, -20, 0.0, 1.0]);
    geom.vData.addAll([-20, 20, 0.0, 1.0]);
    geom.vData.addAll([20, 20, 0.0, 1.0]);
    geom.vData.addAll([20, -20, 0.0, 1.0]);
    geom.iData.addAll([0, 1, 2, 2, 3, 0]);
    geom.uploadGL();
}

  void drawGL(double delta) {
    geom.bindGL();
    program.bindGL();
    GL.viewport(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    GL.drawElements(TRIANGLES, 6, UNSIGNED_SHORT, 0);
    program.unbindGL();
    geom.unbindGL();
 }

}