import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/dialogs/extention_by_dialogs.dart';

import 'handler_exceptions/handler_exceptions.dart';
import 'package:jac/ui/base/baseBloc.dart';

abstract class BaseStateful extends StatefulWidget {
  const BaseStateful({Key? key}) : super(key: key);
}

abstract class BaseStateUI<T extends BaseStateful> extends State<T> {

  void handlerErrorAndProgressbar({required BaseStateBloc stateBloc}) {
    handlerVisibilityProgressbar(showProgress: stateBloc.showProgress);
    if(stateBloc.e == null) return;
    if(!stateBloc.showDialog) return;

    BaseMessageExceptions handler = BaseMessageExceptions.getDetailException(coreException: stateBloc.e!);

    showCustomErrorDialog(
        title: handler.getTitle(),
        message: handler.getMessage(),
        ok: handler.getOk()
    );
  }

  void showCustomAlertDialog({
    required VoidCallback ok,
    required Worlds message,
    required Worlds title,
    VoidCallback? can,
    Worlds accept = Worlds.accept,
    Worlds cancel = Worlds.cancel,
  }){
    showCustomGenericDialog(
      ok: () {
        onBackPressed();
        ok();
      },
      message: message,
      title: title,
      can: can == null ? null :  () {
        onBackPressed();
        can();
      },
      accept: accept,
      cancel: cancel
    );
  }
  void onBackPressed() {
    Navigator.of(context).pop();
  }
}