import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/basic_information_step.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';

class StepFactory {
  static BaseStep getStep({required StepsAvailables step}) {
    return BasicInformationStep();
  }
}