import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/routes/routes.dart';

class MobileApp extends BaseApp{


  @override
  Widget body() {
    return MaterialApp(
      title: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.nameApp),
      theme: defaultTheme(),
      initialRoute: RoutesAvailables.listPersons.getName(),
      routes: getRoutes(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}