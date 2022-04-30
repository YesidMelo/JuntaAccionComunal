import 'package:jac/core/core.dart';
import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/step_factory.dart';
import 'package:jac/ui/mobile/pages/person/preregister_person/steps_availables/steps_availables.dart';
import 'package:jac/ui/mobile/dialogs/dialogs.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class PreRegisterPersonPage extends StatefulWidget{

  @override
  State<PreRegisterPersonPage> createState() => _PreRegisterPersonPageState();
}

class _PreRegisterPersonPageState extends State<PreRegisterPersonPage> {

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
        _handlerErrors(state: state);
        return Scaffold(
          body: SafeArea(
              child: Stepper(
                steps:_listStep(context: context),
              )
          ),
        );
      }
    );
  }

  ///private methods
  List<Step> _listStep({required BuildContext context}) {
    return <Step>[
      StepFactory.getStep(step: StepsAvailables.basicInformation).bodyStep(context: context)
    ];
  }

  void _handlerErrors({required PreregisterPersonPageState state}) {
    if(state is! PreregisterPersonPageErrorState) return;
    if(state.e is PersonModelNull) {
      showCustomErrorDialog(
          title: Worlds.preregister,
          message: Worlds.preregisterFailedLoadForm,
          ok: () {}
      );
      return;
    }
    showCustomErrorDialog(
        title: Worlds.preregister,
        message: Worlds.preregisterFailedLoadForm,
        ok: () {}
    );
  }

}