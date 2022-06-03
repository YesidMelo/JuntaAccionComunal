import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/dialogs/error_dialog.dart';
import 'package:jac/ui/mobile/dialogs/progress_dialog.dart';

extension ShowerDialog on State {

  void showCustomErrorDialog({
    required VoidCallback ok,
    required Worlds message,
    required Worlds title,
    Worlds accept = Worlds.accept
  }) {
    _handlerDialog(
      bodyDialog: errorDialog(
        accept: accept,
        context: context,
        message: message,
        ok: ok,
        title: title,
      )
    );
  }

  void showCustomGenericDialog({
    required VoidCallback ok,
    required Worlds message,
    required Worlds title,
    VoidCallback? can,
    Worlds accept = Worlds.accept,
    Worlds cancel = Worlds.cancel,
  }) {
    _handlerDialog(
      bodyDialog: genericDialog(
        accept: accept,
        can: can,
        cancel: cancel,
        context: context,
        message: message,
        ok: ok,
        title: title,
      )
    );
  }

  void handlerVisibilityProgressbar({required bool showProgress}) {
    if(!showProgress) {
      _hideProgressBar();
      return;
    }
    _showProgress();
  }



  ///private methods
  void _handlerDialog({ required Widget bodyDialog}) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return bodyDialog;
        }
      );
    });
  }

  void _hideProgressBar() {
    if(HandlerProgressBar.getCurrentProgressIndicator() == null) return;
    HandlerProgressBar.closeProgressBar();
  }

  void _showProgress() {
    if(HandlerProgressBar.getCurrentProgressIndicator() != null) return;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext dialogContext) {
          return HandlerProgressBar.loadProgressIndicator(context: context);
        }
      );
    });
  }

}