import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/step_factory.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';
import 'package:jac/ui/mobile/dialogs/dialogs.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';
import 'package:jac/ui/ui.dart';

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
              child: Theme(
                data: Theme.of(context),
                child: Stepper(
                  type: StepperType.vertical,
                  steps:  listSteps.map((current) => current.bodyStep(context: context)).toList(),
                  currentStep: state.currentStep,
                  onStepCancel: ()=> _onStepCancel(currentStep: currentStep),
                  onStepContinue:()=> _onStepContinue(currentStep: currentStep),
                  onStepTapped: (int currentIndexStep) => _goToStep(currentIndexStep: currentIndexStep, state: state),
                ),
              )
          ),
        );
      }
    );
  }

  ///private methods
  List<BaseStep> _listStep({required BuildContext context, required PreregisterPersonPageState state}) {
    return <BaseStep>[
      StepFactory.getStep(step: preregister_steps.basicInformation, state: state),
      StepFactory.getStep(step: preregister_steps.directionPerson, state: state),
    ];
  }

  void _onStepCancel({required BaseStep currentStep}) {
    currentStep.backStep();
  }

  void _onStepContinue({required BaseStep currentStep}) {
    currentStep.nextStep();
  }

  void _goToStep({required int currentIndexStep, required PreregisterPersonPageState state}) {
    if(state.currentPerson == null) return;
    BlocProvider
    .of<PreregisterPersonBloc>(context)
    .add(PreregisterPersonPageUpdatePersonEvent(
        currentPerson: state.currentPerson!,
        currentStep: currentIndexStep,
        listDocuments: state.typeDocumentModel,
        typeDocumentModelSelected: state.typeDocumentModelSelected
    ));
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