import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';

class StepFactory {
  static BaseStep getStep({
    required preregister_steps step,
    required PreregisterPersonPageState state,
  }) {
    int maxSteps = preregister_steps.values.length;
    switch(step) {
      case preregister_steps.directionPerson:
        return DirectionPersonStep(state: state, maxStep: maxSteps);
      default:
        return BasicInformationStep(state: state, maxStep: maxSteps);
    }
  }
}