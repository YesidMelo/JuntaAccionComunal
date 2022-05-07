import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';
import 'package:jac/ui/blocs/person/person.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';


class DirectionPersonStep extends BaseStep {

  CustomTextFormField _direction = CustomTextFormField();
  CustomTextFormField _cellPhone = CustomTextFormField();
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
    _captureData();
    selectNextStep(context: _context!);
  }

  @override
  void backStep() {
    if(_context == null) return;
    _captureData();
    backStepBlocProvider(context: _context!);
  }

  @override
  bool showButtonBack() => true;

  @override
  bool showButtonSend() => true;

  @override
  bool isFinalStep() => true;

  ///private methods
  Widget _body() {
    _generateTextfields();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _dropdownButton(),
        _direction,
        _cellPhone
      ],
    );
  }

  DropdownButton<TypeInhabitantModel> _dropdownButton() {
    return DropdownButton(
      value: state.typeInhabitantSelected,
      items: _getListTypesInhabitants(),
      onChanged: (TypeInhabitantModel? selected) {
        _captureData();
        state.typeInhabitantSelected = selected;
        updateStepBlocEvent(context: _context!);
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
  }

  void _generateTextfields() {
    _direction = CustomTextFormField(
      current: state.currentPerson?.direction?.name ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString),
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterDirection),
      errorText: state.errorDirection,
    );
    _cellPhone = CustomTextFormField(
      current: state.currentPerson?.cellPhone ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString),
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterCellPhone),
      errorText: state.errorCellPhone,
    );
  }

}