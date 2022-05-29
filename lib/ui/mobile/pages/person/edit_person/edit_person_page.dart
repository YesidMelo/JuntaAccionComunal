import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/mobile/routes/routes.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class EditPersonPage extends BaseStateful {

  const EditPersonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPersonPageState();

}

class _EditPersonPageState extends BaseStateUI<EditPersonPage> {

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
      return Scaffold(
        body: SafeArea(
            child: _getBody(state: state)
        ),
      );
    });
  }

  Column _getBody({required EditPersonState state}) {
    return Column(
      children: <Widget>[
        _getTitle(),
        _getNameLastName(state: state),
        _typeDocument(state: state),
        _numberDocument(state: state),
        _direction(state: state),
        _cellPhone(state: state),
      ],
    );
  }

  Text _getTitle() {
    return Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.listPerson));
  }


  CustomTextFormField _getNameLastName({required EditPersonState state}) {
    return CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.namesAndLastNames),
      current: state.data.personModel?.nameLastname,
      enabled: false,
    );
  }

  CustomTextFormField _typeDocument({required EditPersonState state}) {
    return CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.documentType),
      current: state.data.personModel?.typeDocument?.name,
      enabled: false,
    );
  }

  CustomTextFormField _numberDocument({required EditPersonState state}) {
    return CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.numberDocument),
      current: state.data.personModel?.documentNumber,
      enabled: false,
    );
  }

  CustomTextFormField _direction({required EditPersonState state}) {
    return CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.direction),
      current: state.data.personModel?.direction?.name,
      enabled: false,
    );
  }

  CustomTextFormField _cellPhone({required EditPersonState state}) {
    return CustomTextFormField(
      hint: LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.cellPhone),
      current: state.data.personModel?.cellPhone,
      enabled: false,
    );
  }

}