import 'package:jac/ui/common_ui.dart';

ThemeData defaultTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,

    //InputDecoration
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(color: Colors.blueGrey),
      hintStyle: TextStyle(color: Colors.blueGrey),
      errorStyle: TextStyle(color: Colors.red),
    ),

    textTheme: TextTheme(

    )
  );
}