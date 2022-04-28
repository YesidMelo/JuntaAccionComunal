import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/mobile.dart';

abstract class BaseApp extends StatelessWidget {
  static BaseApp selectPlatform() {
    return MobileApp();
  }
}