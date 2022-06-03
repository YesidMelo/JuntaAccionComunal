import 'package:jac/core/core.dart';
import 'package:jac/core/models/person/person_direction_model.dart';
import 'package:jac/ui/mobile/routes/routes.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';
import 'package:jac/ui/mobile/utilsUI/utilsUI.dart';
import 'package:jac/ui/ui.dart';

class EditPersonPage extends BaseStateful {

  const EditPersonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPersonPageState();

}

class _EditPersonPageState extends BaseStateUI<EditPersonPage> {

  CustomTextFormField _cellPhone = CustomTextFormField();
  CustomTextFormField _direction = CustomTextFormField();
  CustomTextFormField _nameLastName = CustomTextFormField();
  CustomTextFormField _numberDocument = CustomTextFormField();
  CustomTextFormField _typeDocument = CustomTextFormField();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      PersonModel model = getArgumentsNavigator(context: context);
      EditPersonBlocData data = EditPersonBlocData();
      data.personModel = model;

      BlocProvider
          .of<EditPersonBloc>(context)
          .add(EditPersonLoadingPersonEvent(data: data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPersonBloc, EditPersonState>(builder: ( _, state) {
      handlerErrorAndProgressbar(stateBloc: state);
      _configCustomFields(state: state);
      _handlerStateSendInfo(state: state);
      return Scaffold(
        body: SafeArea(
            child: _getBody(state: state)
        ),
        floatingActionButton: _editFloating(state: state),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  ///Private methods
  Column _getBody({required EditPersonState state}) {
    return Column(
      children: <Widget>[
        _getTitle(),
        SizedBox(height: Dimentions.dimention20),
        _nameLastName,
        SizedBox(height: Dimentions.dimention20),
        _typeDocument,
        SizedBox(height: Dimentions.dimention20),
        _numberDocument,
        SizedBox(height: Dimentions.dimention20),
        _direction,
        SizedBox(height: Dimentions.dimention20),
        _cellPhone,
      ],
    );
  }

  Text _getTitle() {
    return Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.listPerson));
  }

  Widget _editFloating({required EditPersonState state}) {
    if(!state.data.editing) {
      return FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            BlocProvider
                .of<EditPersonBloc>(context)
                .add(EditPersonChangeInfoEvent(data: state.data));
          }
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                child: const Icon(Icons.close),
                onPressed: () {
                  BlocProvider
                      .of<EditPersonBloc>(context)
                      .add(EditPersonChangeInfoEvent(data: state.data));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: const Icon(Icons.send),
                onPressed: () {
                  _captureData(state: state);
                },
              ),
            ),
          ],
        ),
      ]
    );
  }

  void _configCustomFields({required EditPersonState state}) {
    _nameLastName = CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.namesAndLastNames),
      current: state.data.personModel?.nameLastname,
      enabled: state.data.editing,
      errorText: state.data.nameError,
    );

    _typeDocument = CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.documentType),
      current: state.data.personModel?.typeDocument?.name,
      enabled: false,
    );

    _numberDocument = CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.numberDocument),
      current: state.data.personModel?.documentNumber,
      enabled: state.data.editing,
      errorText: state.data.numberDocumentError,
    );

    _direction = CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.direction),
      current: state.data.personModel?.direction?.name,
      enabled: state.data.editing,
      errorText: state.data.directionError,
    );

    _cellPhone = CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.cellPhone),
      current: state.data.personModel?.cellPhone,
      enabled: state.data.editing,
      errorText: state.data.cellphoneError,
    );

  }

  void _captureData({required EditPersonState state}) {
    PersonModel? personModel = state
      .data
      .personModel
      ?.copyWith(
        cellPhone: _cellPhone.getValue(),
        documentNumber: _numberDocument.getValue(),
        nameLastName: _nameLastName.getValue(),
        personDirectionModel: PersonDirectionModel(name: _direction.getValue())
      )
    ;

    BlocProvider
      .of<EditPersonBloc>(context)
      .add(EditPersonSendInfoEvent(
          data: state.data.copyWith(personModel: personModel)
        )
      )
    ;

  }

  void _handlerStateSendInfo({required EditPersonState state}) {
    if(state is! EditPersonSendedState) return;
    showCustomAlertDialog(
      ok: (){
        onBackPressed();
      },
      title: Worlds.editPerson,
      message: Worlds.editPerson,
      cancel: Worlds.editPerson
    );
  }
}