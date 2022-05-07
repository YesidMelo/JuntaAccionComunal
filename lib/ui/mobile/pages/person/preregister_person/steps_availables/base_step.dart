import 'package:jac/ui/blocs/person/person.dart';
import 'package:jac/ui/common_ui.dart';

abstract class BaseStep {

  final PreregisterPersonPageState state;
  final int maxSteps;

  BaseStep({required this.state, required this.maxSteps});

  Step bodyStep({ required BuildContext context});
  void nextStep();
  void backStep();
  bool showButtonBack();
  bool showButtonSend();
  bool isFinalStep();
}