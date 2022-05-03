import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class BasicInformationStep extends BaseStep {

  final PreregisterPersonPageState state;
  final CustomTextFormField nameTextField = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNamesAndLastNames));
  final CustomTextFormField numberDocumentTextField = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNumberDocument));
  TypeDocumentModel? _documentSelected;
  BuildContext? _context;
  int _maxSteps = 0;

  BasicInformationStep({
    required this.state
  }) {
    _documentSelected = state.typeDocumentModelSelected;
  }

  @override
  Step bodyStep({required BuildContext context, required int maxStep}) {
    _maxSteps = maxStep;
    return Step(
      title: CustomText(text: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterBasicInformation)),
      content: _body(context: context),
    );
  }

  Widget _body({required BuildContext context }) {
    _context = context;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        nameTextField.setValue(current: state.currentPerson?.nameLastname ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
        _getTypesDocument(context: context),
        numberDocumentTextField.setValue(current: state.currentPerson?.documentNumber ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
      ],
    );
  }

  DropdownButton<TypeDocumentModel> _getTypesDocument({required BuildContext context}) {
    return DropdownButton<TypeDocumentModel>(
      value: state.typeDocumentModelSelected,
      items: _listItems(context: context),
      onChanged: (TypeDocumentModel? typeDocumentModel) {

        state.currentPerson!.nameLastname = nameTextField.getValue();
        state.currentPerson!.documentNumber = numberDocumentTextField.getValue();
        state.currentPerson!.typeDocumentModel = typeDocumentModel;
        _documentSelected = typeDocumentModel;

        BlocProvider
          .of<PreregisterPersonBloc>(_context!)
          .add(PreregisterPersonPageUpdatePersonEvent(
            currentPerson: state.currentPerson!,
            currentStep: state.currentStep,
            listDocuments: state.typeDocumentModel,
            typeDocumentModelSelected: _documentSelected
          ));
      }
    );
  }

  List<DropdownMenuItem<TypeDocumentModel>> _listItems({required BuildContext context}) {
    return state
        .typeDocumentModel
        .map((TypeDocumentModel current) {
          return DropdownMenuItem<TypeDocumentModel>(
            value: current,
            child: CustomText(text: current.name),
          );
        })
        .toList();
  }

  @override
  void nextStep() {
    if(_context == null) return;
    if(_maxSteps - 1 == state.currentStep) return;
    BlocProvider
        .of<PreregisterPersonBloc>(_context!)
        .add(PreregisterPersonPageNextStepEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        typeDocumentModelSelected: _documentSelected
    ));
  }

  @override
  void backStep() {
    if(_context == null) return;
    BlocProvider
        .of<PreregisterPersonBloc>(_context!)
        .add(PreregisterPersonPageBackStepEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        typeDocumentModelSelected: _documentSelected
    ));
  }
}