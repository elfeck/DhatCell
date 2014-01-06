part of dhatcell;


class Scene1 extends Scene {

  Player player;
  Bezier bezier;

  Scene1() {
    // entities.add(player = new Player());
    // player.initGL();
    entities.add(bezier = new Bezier([
      new Vec2(0.0, 0.0),
      new Vec2(0.2, 0.8),
      new Vec2(1.0, 0.2),
      new Vec2(0.4, 0.9),
      new Vec2(0.6, 0.9)
    ]));
    bezier.initGL();
  }

}