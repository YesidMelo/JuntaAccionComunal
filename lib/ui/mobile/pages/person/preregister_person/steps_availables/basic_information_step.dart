import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/base_step.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class BasicInformationStep extends BaseStep {

  final PreregisterPersonPageState state;
  final CustomTextFormField nameTextField = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNamesAndLastNames));
  final CustomTextFormField numberDocumentTextField = CustomTextFormField(hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterNumberDocument));

  BasicInformationStep({
    required this.state
  });

  @override
  Step bodyStep({required BuildContext context}) {
    return Step(
        title: CustomText(text: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.preregisterBasicInformation)),
        content: _body(context: context)
    );
  }

  Widget _body({required BuildContext context }) {
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

        BlocProvider
          .of<PreregisterPersonBloc>(context)
          .add(PreregisterPersonPageUpdatePersonEvent(
            currentPerson: state.currentPerson!,
            currentStep: state.currentStep,
            listDocuments: state.typeDocumentModel,
            typeDocumentModelSelected: typeDocumentModel
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
}