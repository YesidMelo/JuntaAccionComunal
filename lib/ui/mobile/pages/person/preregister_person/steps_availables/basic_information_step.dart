import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';

class BasicInformationStep extends BaseStep {
  @override
  Step bodyStep({required BuildContext context}) {
    return const Step(
        title: Text("paso 12"), content: Text("Saludo")
    );
  }

}