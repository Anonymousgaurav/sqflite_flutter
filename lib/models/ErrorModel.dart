import 'package:ilaz/business/ErrorCodes.dart';
import 'package:ilaz/models/BaseModel.dart';

class ErrorModel implements BaseModel {
  int? code;
  String trace;

  ErrorModel({this.code, this.trace = ""});

  bool isSessionError() => (this.code == ErrorCodes.API_ERROR);
}
