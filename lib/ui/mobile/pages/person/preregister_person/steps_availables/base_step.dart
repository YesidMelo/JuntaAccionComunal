import 'package:jac/ui/common_ui.dart';

abstract class BaseStep {
  Step bodyStep({ required BuildContext context, required int maxStep});

  void nextStep();
  void backStep();

}