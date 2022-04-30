import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/dialogs/error_dialog.dart';

extension ShowerDialog on State {
  void showCustomErrorDialog({
    required Function ok,
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

}