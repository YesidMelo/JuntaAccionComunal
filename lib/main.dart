import 'package:jac/ui/ui.dart';

void main() {
  initDI();
  runApp(BaseApp.selectPlatform());
}