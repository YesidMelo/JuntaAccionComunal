import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/step_factory.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';
import 'package:jac/ui/mobile/dialogs/dialogs.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class PreRegisterPersonPage extends StatefulWidget{

  @override
  State<PreRegisterPersonPage> createState() => _PreRegisterPersonPageState();
}

class _PreRegisterPersonPageState extends State<PreRegisterPersonPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider
      .of<PreregisterPersonBloc>(context)
      .add(PreregisterPersonPageLoadEvent())
    ;
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreregisterPersonBloc, PreregisterPersonPageState>(
      builder: (_, state) {
        List<BaseStep> listSteps = _listStep(context: context, state: state);
        BaseStep currentStep = listSteps[state.currentStep];
        _handlerErrors(state: state);
        return Scaffold(
          body: SafeArea(
              child: Stepper(
                steps:  listSteps.map((current) => current.bodyStep(context: context,maxStep: listSteps.length)).toList(),
                currentStep: state.currentStep,
                onStepCancel: ()=> _onStepCancel(currentStep: currentStep),
                onStepContinue:()=> _onStepContinue(currentStep: currentStep),

              )
          ),
        );
      }
    );
  }

  ///private methods
  List<BaseStep> _listStep({required BuildContext context, required PreregisterPersonPageState state}) {
    return <BaseStep>[
      StepFactory.getStep(step: preregister_steps.basicInformation, state: state)
    ];
  }

  void _onStepCancel({required BaseStep currentStep}) {
    currentStep.backStep();
  }

  void _onStepContinue({required BaseStep currentStep}) {
    currentStep.nextStep();
  }

  void _handlerErrors({required PreregisterPersonPageState state}) {
    if(state is! PreregisterPersonPageErrorState) return;
    if(state.e is PersonModelNullException) {
      showCustomErrorDialog(
          title: Worlds.preregister,
          message: Worlds.preregisterFailedLoadForm,
          ok: () {}
      );
      return;
    }
    if(state.e is ListTypeDocumentEmptyException) {
      showCustomErrorDialog(
          title: Worlds.preregister,
          message: Worlds.preregisterFailedLoadForm,
          ok: () {}
      );
      return;
    }
    showCustomErrorDialog(
        title: Worlds.preregister,
        message: Worlds.preregisterFailedLoadForm,
        ok: () {}
    );
  }

}