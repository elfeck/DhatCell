library dhatcell;

import 'dart:web_gl';
import 'dart:html';
import 'dart:async';
import 'dart:typed_data';
import 'dart:math';

part 'Uniform.dart';
part 'Vec.dart';
part 'Mat.dart';
part 'Vec2.dart';
part 'Vec3.dart';
part 'Vec4.dart';

part 'ShaderSource.dart';
part 'ShaderProgram.dart';
part 'Geom.dart';
part 'Input.dart';
part 'Player.dart';


RenderingContext GL;
Input input;

int DISPLAY_WIDTH = 600;
int DISPLAY_HEIGHT = 450;

class DhatCell {
  
  CanvasElement canvas;
  Player player;
  double last;

  bool initGL() {
    canvas = query("#canvas");
    GL = canvas.getContext("experimental-webgl");
    if(GL == null) {
      query("#footer").text = "I am very sorry but you need WebGL support :(";
      query("#header").text = "I am very sorry but you need WebGL support :(";
      return false;
    }
    GL.clearColor(0.0, 0.0, 0.0, 1.0);
    return true;
  }

  void initGame() {        
    canvas.width = DISPLAY_WIDTH;
    canvas.height = DISPLAY_HEIGHT;
    input = new Input(canvas.documentOffset);
    player = new Player();
    player.initGL();
    last = 0.0;
  }

  void drawGL(num now) {
    double delta = now - last;
    last = now;
    // print("Looptime: $delta ms");
    GL.clear(COLOR_BUFFER_BIT);
    player.drawGL(delta);
    input.resetRelease();
    display();
  }
  
  void display() {
    window.animationFrame.then(drawGL);
  }

}

void main() {
  DhatCell game = new DhatCell();
  if(!game.initGL()) return;
  game.initGame();
  game.drawGL(0);
}
