import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/mobile.dart';

abstract class BaseApp extends StatelessWidget {
  static BaseApp selectPlatform() {
    return MobileApp();
  }

  /*
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [],
    child: body(),
  );
  */

  @override
  Widget build(BuildContext context) => body();

  @protected
  Widget body();
}