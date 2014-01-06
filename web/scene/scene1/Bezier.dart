part of dhatcell;


class Bezier implements Entity {

  List<Vec2> curve;
  ShaderProgram program;
  Geom geom;

  Mat mvpMatrix;

  Bezier(List<Vec2> points) {
    double scale = 400.0;
    curve = new List<Vec2>();
    for(double i = 0.0; i < 1; i+=0.025) {
      curve.add(compute(points, i).mulScalar(scale));
    }
    curve.forEach((e) => print(e.toString()));
   
    mvpMatrix = new Mat.fromList([
      1.0 / DISPLAY_WIDTH, 0, 0, 0,
      0, 1.0 / DISPLAY_HEIGHT, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1
    ]);
  }

  void initGL() {
    program = new ShaderProgram();
    program.initGL(player_vert, player_frag);
    program.addUniformGL("mvp_matrix", mvpMatrix);
    
    geom = new Geom();
    geom.initGL(program.program, {"vert_position" : 4});
    curve.forEach((e) => new Vec4(e.x, e.y, 0.0, 1.0).collect(geom.vData));
    for(int i = 1; i < curve.length; i++) geom.iData.addAll([i - 1, i]);
    geom.uploadGL();
  }

  Vec2 compute(List<Vec2> points, double t) {
    if(points.length == 1) return new Vec2.copy(points[0]);
    else {
      List<Vec2> init = new List<Vec2>.from(points);
      init.removeAt(0);
      List<Vec2> tail = new List<Vec2>.from(points);
      tail.removeAt(points.length -1);
      return compute(init, t).mulScalar(1 - t).addVec(compute(tail, t).mulScalar(t));
    }
  }

  void doLogic(double delta) {

  }

  void drawGL(double delta) {
    geom.bindGL();
    program.bindGL();
    GL.viewport(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    GL.drawElements(LINES, curve.length - 1, UNSIGNED_SHORT, 0);
    program.unbindGL();
    geom.unbindGL();
  }

}