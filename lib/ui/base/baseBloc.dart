import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  Future<void> sendEventToAnalytics({required CoreException exception, required StackTrace stacktrace}) async {
    print(stacktrace.toString());
  }
}