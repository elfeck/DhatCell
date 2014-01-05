library dhatcell;

import 'dart:web_gl';
import 'dart:html';
import 'dart:async';
import 'dart:typed_data';
import 'dart:math';

part 'Input.dart';

part 'math/Vec.dart';
part 'math/Mat.dart';
part 'math/Vec2.dart';
part 'math/Vec3.dart';
part 'math/Vec4.dart';
part 'scene/Scene.dart';
part 'scene/Entity.dart';
part 'gfx/Uniform.dart';
part 'gfx/ShaderSource.dart';
part 'gfx/ShaderProgram.dart';
part 'gfx/Geom.dart';
part 'scene/scene1/Scene1.dart';
part 'scene/scene1/Player.dart';


RenderingContext GL;
Input input;

int DISPLAY_WIDTH = 600;
int DISPLAY_HEIGHT = 450;

class DhatCell {
  
  CanvasElement canvas;
  List<Scene> scenes;
  int activeScene;
  double last;

  DhatCell() {
    scenes = new List<Scene>();
    activeScene = -1;
    last = 0.0;
  }

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

    scenes.add(new Scene1());
    activeScene = 0;
  }

  void nextFrame(num now) {
    double delta = now - last;
    last = now;

    input.resetRelease();
    execDoLogic(delta);
    execDrawGL(delta);

    display();
  }

  void execDoLogic(double delta) {
    if(activeScene != -1) scenes[activeScene].delegateDoLogic(delta);
  }

  void execDrawGL(double delta) {
    GL.clear(COLOR_BUFFER_BIT);
    if(activeScene != -1) scenes[activeScene].delegateDrawGL(delta);
  }
  
  void display() {
    window.animationFrame.then(nextFrame);
  }

}

void main() {
  DhatCell game = new DhatCell();
  if(!game.initGL()) return;
  game.initGame();
  game.execDrawGL(0.0);
}
