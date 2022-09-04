import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


 class Utils {
  static showToast(String value) {
   Fluttertoast.showToast(
    msg: value,
    toastLength: Toast.LENGTH_SHORT
   );
  }

  static Future<bool> checkInternet() async {
   var connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile) {
    return true;
   } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
   }
   return false;
  }

 }