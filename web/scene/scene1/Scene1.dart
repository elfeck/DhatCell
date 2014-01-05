part of dhatcell;


class Scene1 extends Scene {

  Player player;

  Scene1() {
    entities.add(player = new Player());
    player.initGL();
  }

}