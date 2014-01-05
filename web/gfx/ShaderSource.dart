part of dhatcell;

String player_vert = '''
#version 100
precision mediump float;

uniform mat4 mvp_matrix;
uniform vec2 offset;

attribute vec4 vert_position;

void main() {
  vec4 pos = mvp_matrix * vec4(vert_position.xy + offset, vert_position.zw);
  gl_Position = pos;
}
''';

String player_frag = '''
#version 100
precision mediump float;

void main() {
  gl_FragColor = vec4(0.8, 0.3, 0.4, 1.0);
}
''';