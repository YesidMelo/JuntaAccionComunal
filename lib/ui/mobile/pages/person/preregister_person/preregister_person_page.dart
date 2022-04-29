import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/step_factory.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class PreRegisterPersonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          steps:_listStep(context: context),
        )
        ),
    );
  }

  ///private methods
  List<Step> _listStep({required BuildContext context}) {
    return <Step>[
      StepFactory.getStep(step: StepsAvailables.basicInformation).bodyStep(context: context)
    ];
  }

}