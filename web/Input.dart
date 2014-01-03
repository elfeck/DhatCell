part of dhatcell;


class Input {

  Map<int, bool> pressed, released;
  bool mouseClick, mouseDrag;
  Point<int> docOffs;
  int mouseX, mouseY;

  Input(Point<int> this.docOffs) : super() {
    pressed = new Map<int, bool>();
    released = new Map<int, bool>();
    window.onKeyDown.listen((KeyboardEvent e) {
      pressed.putIfAbsent(e.keyCode, () => false);
      pressed[e.keyCode] = true;
    });
    window.onKeyUp.listen((KeyboardEvent e) {
      pressed[e.keyCode] = false;
      released.putIfAbsent(e.keyCode, () => false);
      released[e.keyCode] = true;
    });
    window.onClick.listen((MouseEvent e) {
      print("click");
      mouseClick = true;
    });
    window.onDragStart.listen((MouseEvent e) {
      mouseDrag = true;
    });
    window.onDragEnd.listen((MouseEvent e) {
      mouseDrag = false;
    });
    query("#canvas").onMouseMove.listen((MouseEvent e) {
      mouseX = e.offset.x;
      mouseY = e.offset.y;
    });
  }
  
  bool isKeyPressed(int keyCode) {
    pressed.putIfAbsent(keyCode, () => false);
    return pressed[keyCode];
  }
  
  bool isKeyReleased(int keyCode) {
    released.putIfAbsent(keyCode, () => false);
    return released[keyCode];
  }

  void resetRelease() {
    released.forEach((k, v) => released[k] = false);
    mouseClick = false;
  }

  Point<int> getMouseCoord() {
    return new Point<int>(mouseX, mouseY);
  }

}