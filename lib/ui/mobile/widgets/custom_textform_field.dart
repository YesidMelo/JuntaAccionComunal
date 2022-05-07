import 'package:jac/ui/common_ui.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();
  String? current;
  String? errorText;
  String? hint;

  CustomTextFormField({
    this.current,
    this.hint,
    this.errorText,
    Key? key
  }) : super(key: key) {
    _controller.text = current ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: hint,
          errorText: errorText,
          errorStyle: Theme.of(context).textTheme.bodyText1
      ),
    );
  }

  String getValue() => _controller.text.toString();

}
