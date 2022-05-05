import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';
import 'package:jac/ui/blocs/person/person.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';


class DirectionPersonStep extends BaseStep {

  final CustomTextFormField _direction = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterDirection));
  final CustomTextFormField _cellPhone = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterCellPhone));
  TypeInhabitantModel? _typeInhabitantModelSelected;
  BuildContext? _context;

  DirectionPersonStep({
    required PreregisterPersonPageState state,
    required int maxStep
  }) : super(state: state, maxSteps: maxStep);

  @override
  Step bodyStep({required BuildContext context}) {
    _context = context;
    return Step(
      title: Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterContact)),
      content: _body()
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
        typeDocumentModelSelected: state.typeDocumentModelSelected,
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
        typeDocumentModelSelected: state.typeDocumentModelSelected,
        typeInhabitantSelected: state.typeInhabitantSelected,
    ));

  }

  @override
  bool showButtonBack() => true;

  @override
  bool showButtonSend() => true;

  @override
  bool isFinalStep() => true;

  @override
  bool validStep() {
    return false;
  }

  ///private methods
  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _dropdownButton(),
        _direction.setValue(current: state.currentPerson?.direction?.name ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
        _cellPhone.setValue(current: state.currentPerson?.cellPhone ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString))
      ],
    );
  }

  DropdownButton<TypeInhabitantModel> _dropdownButton() {
    return DropdownButton(
      value: state.typeInhabitantSelected,
      items: _getListTypesInhabitants(),
      onChanged: (TypeInhabitantModel? selected) {
        _typeInhabitantModelSelected = selected;
        _captureData();
        BlocProvider
          .of<PreregisterPersonBloc>(_context!)
          .add(PreregisterPersonPageUpdatePersonEvent(
            currentPerson: state.currentPerson!,
            currentStep: state.currentStep,
            listDocuments: state.typeDocumentModel,
            listTypeInhabitants: state.listTypeInhabitants,
            typeDocumentModelSelected: state.typeDocumentModelSelected,
            typeInhabitantSelected: _typeInhabitantModelSelected,
        ));
      }
    );
  }

  List<DropdownMenuItem<TypeInhabitantModel>> _getListTypesInhabitants() {
    return state
      .listTypeInhabitants
      .map((current) => _getItem(model: current))
      .toList()
    ;
  }

  DropdownMenuItem<TypeInhabitantModel> _getItem({required TypeInhabitantModel model}) {
    return DropdownMenuItem<TypeInhabitantModel>(
      child: Text(model.name),
      value: model,
    );
  }


  void _captureData() {
    state.currentPerson?.direction = PersonDirectionModel(name: _direction.getValue());
    state.currentPerson?.cellPhone = _cellPhone.getValue();
    state.typeInhabitantSelected = _typeInhabitantModelSelected;
  }

}