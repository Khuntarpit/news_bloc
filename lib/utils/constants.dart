import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

const DEBUG = true;
var logger = Logger();

void printLog(String val){
  if(DEBUG) logger.d(val);
}

void printErrorLog(String val){
  if(DEBUG) logger.e(val);
}

bool checkResponse(int? code){
  return code == 200 ? true : false;
}