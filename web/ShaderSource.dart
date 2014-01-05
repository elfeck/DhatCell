part of dhatcell;

String player_vert = '''
#version 100
precision mediump float;

uniform mat4 mvp_matrix;
uniform vec2 offset;

attribute vec4 vert_position;
varying vec2 frag_position;

void main() {
  vec4 pos = mvp_matrix * vec4(vert_position.xy + offset, vert_position.zw);
  frag_position = vec2(pos.xy);
  gl_Position = pos;
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