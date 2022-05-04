import 'package:jac/ui/blocs/person/person.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';


class DirectionPersonStep extends BaseStep {

  final CustomTextFormField _direction = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterDirection));

  BuildContext? _context;

  DirectionPersonStep({
    required PreregisterPersonPageState state,
    required int maxStep
  }) : super(state: state, maxSteps: maxStep);

  @override
  Step bodyStep({required BuildContext context}) {
    _context = context;
    return Step(
      title: Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterDirection)),
      content: _body()
    );
  }

  @override
  void nextStep() {
    if(_context == null) return;
    if(maxSteps - 1 == state.currentStep) return;
    _captureData();
    BlocProvider
        .of<PreregisterPersonBloc>(_context!)
        .add(PreregisterPersonPageNextStepEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        typeDocumentModelSelected: state.typeDocumentModelSelected
    ));
  }

  @override
  void backStep() {
    if(_context == null) return;
    _captureData();
    BlocProvider
        .of<PreregisterPersonBloc>(_context!)
        .add(PreregisterPersonPageBackStepEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        typeDocumentModelSelected: state.typeDocumentModelSelected
    ));

  }

  ///private methods
  Widget _body() {
    return _direction;
  }

  void _captureData() {

  }

}