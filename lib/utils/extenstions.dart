
import 'package:intl/intl.dart';

extension DateExt on DateTime {

  String get dayFormat  => DateFormat('d/MMM/yy').format(this);
  String get dateFormat => DateFormat('dd/MM/yy').format(this);
  String get timeFormat => DateFormat('kk: ss  aa').format(this);

}