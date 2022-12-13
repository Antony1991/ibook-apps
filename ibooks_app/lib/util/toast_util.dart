import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static show(String msg) {
    Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
}
