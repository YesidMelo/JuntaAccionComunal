import 'package:jac/ui/common_ui.dart';

Widget errorDialog({
  required BuildContext context,
  required Worlds title,
  required Worlds message,
  required VoidCallback ok,
  Worlds accept = Worlds.accept
}) {
  return AlertDialog(
    title: Text(LanguageFactory.getCurrentLanguage().getWorld(world: title)),
    content: Text(LanguageFactory.getCurrentLanguage().getWorld(world: message)),
    actions: [
      TextButton(
        child: Text(
          LanguageFactory.getCurrentLanguage().getWorld(world: accept),
        ),
        onPressed: ok
      ),
    ],
  );
}

Widget genericDialog({
  required BuildContext context,
  required Worlds title,
  required Worlds message,
  required VoidCallback ok,
  VoidCallback? can,
  Worlds accept = Worlds.accept,
  Worlds cancel = Worlds.accept
}) {
  List<Widget> actions = <Widget>[];
  actions.add(TextButton(
    child: Text(
      LanguageFactory.getCurrentLanguage().getWorld(world: accept),
    ),
    onPressed: ok,
  ));
  if(can != null) {
    actions.add(TextButton(
      child: Text(
        LanguageFactory.getCurrentLanguage().getWorld(world: cancel),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        can();
      },
    ));
  }
  return AlertDialog(
    title: Text(LanguageFactory.getCurrentLanguage().getWorld(world: title)),
    content: Text(LanguageFactory.getCurrentLanguage().getWorld(world: message)),
    actions: actions,
  );
}
