import 'package:jac/ui/common_ui.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();
  String? current;
  String? errorText;
  String? hint;
  bool enabled;

  CustomTextFormField({
    this.current,
    this.hint,
    this.errorText,
    this.enabled = true,
    Key? key
  }) : super(key: key) {
    _controller.text = current ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
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
