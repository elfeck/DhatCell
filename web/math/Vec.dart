part of dhatcell;


abstract class Vec extends Uniform {

  int dim();
  double length();
  bool zero();

  List<double> toList();
  Float32List toTypedList();
  String toString();
  void collect(List<double> list);

}
