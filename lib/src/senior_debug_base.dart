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

      final st2 = st.traces
          .map((e) => e.frames)
          .expand((element) => element)
          .map((e) => '${e.uri.toString()}:${e.line}:${e.column}')
          .where((element) => !element.contains('senior_debug/src/senior_debug_base.dart'))
          .indexed
          .map((e) => '#${e.$1} ${e.$2}');
      buffer.writeln();
      buffer.writeln(st2.join('\n').trim());
      // print(StackTrace.current);
    }
    print(buffer);
  }

  void operator [](dynamic suffix) => call(suffix);
  void get here => call();
}
