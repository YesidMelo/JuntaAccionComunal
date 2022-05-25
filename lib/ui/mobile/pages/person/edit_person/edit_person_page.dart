import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/mobile/routes/routes.dart';

class EditPersonPage extends BaseStateful {

  const EditPersonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPersonPageState();

}

class _EditPersonPageState extends BaseStateUI<EditPersonPage> {
  @override
  Widget build(BuildContext context) {
    PersonModel model = getArgumentsNavigator(context: context);
    return const Scaffold(
      body: Text("Hola mono"),
    );
  }

}