import 'package:jac/ui/common_ui.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hint;
  final TextEditingController _controller = TextEditingController();

  CustomTextFormField({
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: hint
      ),
    );
  }

  CustomTextFormField setValue({required String current}) {
    _controller.text = current;
    return this;
  }

  String getValue() => _controller.text.toString();
}