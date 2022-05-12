import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/step_factory.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';
import 'package:jac/ui/ui.dart';

class PreRegisterPersonPage extends BaseStateful {

  const PreRegisterPersonPage({Key? key}) : super(key: key);

  @override
  State<PreRegisterPersonPage> createState() => _PreRegisterPersonPageState();
}

class _PreRegisterPersonPageState extends BaseStateUI<PreRegisterPersonPage> {

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
        handlerErrorAndProgressbar(stateBloc: state);
        return Scaffold(
          body: SafeArea(
              child: Theme(
                data: Theme.of(context),
                child: Column(
                  children: <Widget>[
                    Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregister)),
                    _stepperPreregister(state: state, context: context),
                  ],
                )
              )
          ),
        );
      }
    );
  }

  ///private methods


  Stepper _stepperPreregister({required PreregisterPersonPageState state, required BuildContext context}) {
    List<BaseStep> listSteps = _listStep(context: context, state: state);
    BaseStep currentStep = listSteps[state.currentStep];
    return Stepper(
      type: StepperType.vertical,
      steps:  listSteps.map((current) => current.bodyStep(context: context)).toList(),
      currentStep: state.currentStep,
      //onStepTapped: (int currentIndexStep) => _goToStep(currentIndexStep: currentIndexStep, state: state),
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return _buttonsStepper(
          currentStep: currentStep,
          state: state,
        );
      },
    );
  }

  List<BaseStep> _listStep({required BuildContext context, required PreregisterPersonPageState state}) {
    return <BaseStep>[
      StepFactory.getStep(step: preregister_steps.basicInformation, state: state),
      StepFactory.getStep(step: preregister_steps.directionPerson, state: state),
    ];
  }

  void _goToStep({required int currentIndexStep, required PreregisterPersonPageState state}) {
    if(state.currentPerson == null) return;
    BlocProvider
    .of<PreregisterPersonBloc>(context)
    .add(PreregisterPersonPageUpdatePersonEvent(
        currentPerson: state.currentPerson!,
        currentStep: currentIndexStep,
        listDocuments: state.typeDocumentModel,
        listTypeInhabitants: state.listTypeInhabitants,
        typeDocumentModelSelected: state.typeDocumentModelSelected,
        typeInhabitantSelected: state.typeInhabitantSelected,
    ));
  }


  Widget _buttonsStepper({required PreregisterPersonPageState state, required BaseStep currentStep}) {
    String buttonBack = LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.back);
    String buttonContinue = !currentStep.isFinalStep()
      ? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.commonContinue)
      : LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.send)
    ;
    return Row(
      children: <Widget>[
        currentStep.showButtonBack()
          ? TextButton(onPressed: (){
              currentStep.backStep();
            }, child: Text(buttonBack))
          : const SizedBox()
        ,
        currentStep.showButtonSend()
          ? TextButton(
              onPressed: (){
                currentStep.nextStep();
              }, child: Text(buttonContinue))
          : const SizedBox()
        ,
      ],
    );
  }

}