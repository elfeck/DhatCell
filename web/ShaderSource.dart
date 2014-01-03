part of dhatcell;

String player_vert = '''
#version 100
precision mediump float;

attribute vec4 vert_position;
varying vec2 frag_position;

void main() {
  frag_position = vec2(vert_position.xy);
  gl_Position = vert_position;
}
''';

String player_frag = '''
#version 100
precision mediump float;

varying vec2 frag_position;

void main() {
  gl_FragColor = vec4(frag_position.xy, 0.4 + frag_position.y * 0.5, 1.0);
}
''';