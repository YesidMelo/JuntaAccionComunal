import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/dialogs/extention_by_dialogs.dart';

import 'handler_exceptions/handler_exceptions.dart';
import 'package:jac/ui/base/baseBloc.dart';

abstract class BaseStateful extends StatefulWidget {
  const BaseStateful({Key? key}) : super(key: key);
}

abstract class BaseStateUI<T extends BaseStateful> extends State<T> {

  void showError({required BaseStateBloc stateBloc}) {
    if(stateBloc.e == null) return;
    if(!stateBloc.showDialog) return;

    BaseMessageExceptions handler = BaseMessageExceptions.getDetailException(coreException: stateBloc.e!);

    showCustomErrorDialog(
        title: handler.getTitle(),
        message: handler.getMessage(),
        ok: handler.getOk()
    );
  }
}