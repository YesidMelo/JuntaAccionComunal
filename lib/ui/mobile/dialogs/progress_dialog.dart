import 'package:jac/ui/common_ui.dart';

class HandlerProgressBar {

  static Widget? _currentProgress;
  static BuildContext? _currentContext;

  static Widget? getCurrentProgressIndicator() => _currentProgress;
  static BuildContext? getCurrentContext()=> _currentContext;

  static Widget loadProgressIndicator({required BuildContext context}) {
    _currentProgress = _generateProgress(context: context);
    _currentContext = context;
    return _currentProgress!;
  }

  static void closeProgressBar() {
    if(_currentContext == null) return;
    Navigator.of(_currentContext!).pop();
    _currentProgress = null;
    _currentContext = null;
  }


  static Widget _generateProgress({required BuildContext context}) {
    return const AlertDialog(
      content: LinearProgressIndicator(),
    );
  }

  HandlerProgressBar._();
}