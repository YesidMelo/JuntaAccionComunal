import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class BasicInformationStep extends BaseStep {

  CustomTextFormField nameTextField = CustomTextFormField();
  CustomTextFormField numberDocumentTextField = CustomTextFormField();
  String? _errorNameField = "1111";
  String? _errorDocumentField;
  TypeDocumentModel? _documentSelected;
  BuildContext? _context;

  BasicInformationStep({
    required PreregisterPersonPageState state,
    required int maxStep
  }): super(state: state, maxSteps: maxStep) {
    _documentSelected = state.typeDocumentModelSelected;
  }

  @override
  Step bodyStep({required BuildContext context}) {
    return Step(
      title: CustomText(text: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterBasicInformation)),
      content: _body(context: context),
    );
  }

  Widget _body({required BuildContext context }) {
    _context = context;
    _generateTextFields();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        nameTextField,
        _getTypesDocument(context: context),
        numberDocumentTextField,
      ],
    );
  }

  DropdownButton<TypeDocumentModel> _getTypesDocument({required BuildContext context}) {
    return DropdownButton<TypeDocumentModel>(
      value: state.typeDocumentModelSelected,
      items: _listItems(context: context),
      onChanged: (TypeDocumentModel? typeDocumentModel) {
        _documentSelected = typeDocumentModel;
        _captureData();
        BlocProvider
          .of<PreregisterPersonBloc>(_context!)
          .add(PreregisterPersonPageUpdatePersonEvent(
            currentPerson: state.currentPerson!,
            currentStep: state.currentStep,
            listDocuments: state.typeDocumentModel,
            listTypeInhabitants: state.listTypeInhabitants,
            typeDocumentModelSelected: _documentSelected,
            typeInhabitantSelected: state.typeInhabitantSelected,
          ));
      }
    );
  }

  @override
  void nextStep() {
    if(_context == null) return;
    if(maxSteps - 1 == state.currentStep) return;
    _captureData();
    if(!validStep()) return;
    BlocProvider
      .of<PreregisterPersonBloc>(_context!)
      .add(PreregisterPersonPageNextStepEvent(
        currentPerson: state.currentPerson!,
        currentStep: state.currentStep,
        listDocuments: state.typeDocumentModel,
        listTypeInhabitants: state.listTypeInhabitants,
        typeDocumentModelSelected: _documentSelected,
        typeInhabitantSelected: state.typeInhabitantSelected,
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
        listTypeInhabitants: state.listTypeInhabitants,
        typeDocumentModelSelected: _documentSelected,
        typeInhabitantSelected: state.typeInhabitantSelected,
    ));
  }

  @override
  bool showButtonBack() => false;

  @override
  bool showButtonSend() => true;

  @override
  bool isFinalStep() => false;

  @override
  bool validStep() {
    try {
      state.currentPerson?.nameLastname.validNameAndLastName();
      state.currentPerson?.documentNumber.validDocumentationNumber();
      return true;
    } on NameAndLastNameEmptyException catch (nameEmptyException, stacktrace){
      //_errorNameField = LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.thisFieldIsEmpty);
      _errorNameField = "111";
      _generateTextFields();
      print(stacktrace.toString());
      return false;
    } on NameAndLastNameLengthException catch (nameLengthException, stacktrace){
      print(stacktrace.toString());
      return false;
    } on NumberDocumentationEmptyException catch(nDEmptyExeption, stacktrace){
      _errorDocumentField = LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.thisFieldIsEmpty);
      print(stacktrace.toString());
      return false;
    } on NumberDocumentationLengthException catch (nDLengthException, stacktrace){
      print(stacktrace.toString());
      return false;
    }
  }

  ///private methods

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

  void _captureData() {
    state.currentPerson!.nameLastname = nameTextField.getValue();
    state.currentPerson!.documentNumber = numberDocumentTextField.getValue();
    state.currentPerson!.typeDocument = _documentSelected;
  }

  void _generateTextFields() {
     nameTextField = CustomTextFormField(
      current: state.currentPerson?.nameLastname ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString),
      errorText: _errorNameField,
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNamesAndLastNames),
    );
    numberDocumentTextField = CustomTextFormField(
      current: state.currentPerson?.documentNumber ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString),
      errorText: _errorDocumentField,
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNumberDocument),
    );
  }

}