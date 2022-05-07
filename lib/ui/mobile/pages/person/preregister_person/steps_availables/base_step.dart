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

  void selectNextStep({required BuildContext context}) {
    if(maxSteps - 1 == state.currentStep) {
      sendStepBlocProvider(context: context);
      return;
    }
    nextStepBlocProvider(context: context);
  }


  void nextStepBlocProvider({required BuildContext context}) {
    BlocProvider
    .of<PreregisterPersonBloc>(context)
    .add(PreregisterPersonPageNextStepEvent(
      currentPerson: state.currentPerson!,
      currentStep: state.currentStep,
      listDocuments: state.typeDocumentModel,
      listTypeInhabitants: state.listTypeInhabitants,
      typeDocumentModelSelected: state.typeDocumentModelSelected,
      typeInhabitantSelected: state.typeInhabitantSelected,
    ));
  }

  void sendStepBlocProvider({required BuildContext context}) {
    BlocProvider
      .of<PreregisterPersonBloc>(context)
      .add(PreregisterPersonPageSendPersonEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        listTypeInhabitants: state.listTypeInhabitants,
        typeDocumentModelSelected: state.typeDocumentModelSelected,
        typeInhabitantSelected: state.typeInhabitantSelected,
      ))
    ;
  }

  void backStepBlocProvider({required BuildContext context}) {
    BlocProvider
    .of<PreregisterPersonBloc>(context)
    .add(PreregisterPersonPageBackStepEvent(
      currentPerson: state.currentPerson!,
      currentStep: state.currentStep,
      listDocuments: state.typeDocumentModel,
      listTypeInhabitants: state.listTypeInhabitants,
      typeDocumentModelSelected: state.typeDocumentModelSelected,
      typeInhabitantSelected: state.typeInhabitantSelected,
    ));
  }

  void updateStepBlocEvent({required BuildContext context}) {
    BlocProvider
    .of<PreregisterPersonBloc>(context)
    .add(PreregisterPersonPageUpdatePersonEvent(
      currentPerson: state.currentPerson!,
      currentStep: state.currentStep,
      listDocuments: state.typeDocumentModel,
      listTypeInhabitants: state.listTypeInhabitants,
      typeDocumentModelSelected: state.typeDocumentModelSelected,
      typeInhabitantSelected: state.typeInhabitantSelected,
    ));
  }
}