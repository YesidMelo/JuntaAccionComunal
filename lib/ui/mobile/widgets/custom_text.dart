import 'package:jac/ui/common_ui.dart';

class CustomText extends StatelessWidget {

  final String text;
  final TextStyle? style;

  const CustomText({
    required this.text,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }

}