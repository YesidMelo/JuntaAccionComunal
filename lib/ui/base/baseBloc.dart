import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';

abstract class BaseStateBloc {
  CoreException? e;
  bool showDialog;
  bool showProgress;

  BaseStateBloc({
    this.e,
    this.showDialog = false,
    this.showProgress = false,
  });
}


abstract class BaseBloc<Event, BaseStateBloc> extends Bloc<Event, BaseStateBloc> {
  BaseBloc(BaseStateBloc initialState) : super(initialState);

  Future<void> sendEventToAnalytics({required CoreException exception, required StackTrace stacktrace}) async {
    print(stacktrace.toString());
  }
}