part of dhatcell;


abstract class Scene {

  List<Entity> entities;

  Scene() {
    entities = new List<Entity>();
  }

  void delegateDoLogic(double delta) {
    entities.forEach((e) => e.doLogic(delta));
  }

  void delegateDrawGL(double delta) {
    entities.forEach((e) => e.drawGL(delta));
  }

}