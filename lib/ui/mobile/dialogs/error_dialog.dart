import 'package:jac/ui/common_ui.dart';

Widget errorDialog({
  required BuildContext context,
  required Worlds title,
  required Worlds message,
  required Function ok,
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
        onPressed: () {
          Navigator.of(context).pop();
          ok();
        },
      ),
    ],
  );
}
