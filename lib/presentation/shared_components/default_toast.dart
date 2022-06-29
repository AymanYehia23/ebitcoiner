import 'package:fluttertoast/fluttertoast.dart';
import 'package:ebitcoiner/core/constants/colors.dart';

Future defaultToast({
  required String text,
  bool isError = false,
}) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
    msg: text,
    toastLength: isError ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor:
        isError ? ColorManager.red : ColorManager.green,
    textColor: ColorManager.white,
    fontSize: 16.0,
  );
}
