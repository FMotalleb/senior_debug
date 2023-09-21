import 'package:senior_debug/senior_debug.dart';

void main() {
  here;
  here;
  here;
  here;
  printStackTrace = true;
  here;
  hereDbg['WHERE IS THIS'];

  SeniorDebug('Test')[15];
}
/*Out:
  > here 0
  > here 1
  > here 2
  > here 3
  > here 4
  > file:///.../senior_debug/example/senior_debug_example.dart:9:3
  > 
  > here WHERE IS THIS
  > file:///.../example/senior_debug_example.dart:10:10
  > 
  > Test 15
  > file:///.../example/senior_debug_example.dart:12:22
*/