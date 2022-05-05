import 'package:jac/ui/common_ui.dart';

class CustomTextFormField extends StatefulWidget {

  final _CustomTextFormFieldState _state = _CustomTextFormFieldState();
  String? errorText;
  String? hint;
  String? current;

  CustomTextFormField({
    this.hint,
    this.errorText,
    this.current,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _state;

  String getValue() => _state.getValue();

}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _controller.text = widget.current ?? "";
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.hint,
        errorText: widget.errorText,
        errorStyle: Theme.of(context).textTheme.headline2
      ),
    );
  }

  String getValue() => _controller.text.toString();
}