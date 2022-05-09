import 'package:jac/core/models/person/person_direction_model.dart';

extension PersonDirectionMapper on PersonDirectionModel {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name
    };
  }
}