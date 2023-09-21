import 'package:stack_trace/stack_trace.dart';

int _counter = 0;
bool printStackTrace = false;
void get here => hereDbg[_counter++];
final hereDbg = SeniorDebug('here');

class SeniorDebug {
  SeniorDebug([
    this.initialMessage = '',
  ]);
  final String initialMessage;
  void call([dynamic suffix]) {
    final buffer = StringBuffer(initialMessage);
    if (suffix != null) {
      buffer.write(' $suffix');
    }
    if (printStackTrace) {
      final st = Chain.current().terse;
      final st2 = st
          .foldFrames((p0) {
            // print(p0.library + '${counter++}');
            return p0.uri.path != 'package:senior_debug/src/senior_debug_base.dart';
          })
          .toTrace()
          .frames
          .map((e) => '${e.uri}:${e.line}:${e.column}');
      buffer.writeln();
      buffer.writeln(st2.join('\n').trim());
      // print(StackTrace.current);
    }
    print(buffer);
  }

  void operator [](dynamic suffix) => call(suffix);
  void get here => call();
}
