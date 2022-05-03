import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';

class StepFactory {
  static BaseStep getStep({required preregister_steps step, required PreregisterPersonPageState state}) {
    return BasicInformationStep(state: state);
  }
}