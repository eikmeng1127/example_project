import 'package:example_project/widgets/Customs/CustomLoadingDialog.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog(
      barrierColor: Colors.transparent, //set the background of the not clickable place around the dialog
      context: context,
      barrierDismissible: false, //
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CustomLoadingDialog(
            key: key,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 10, //Indicator Width
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red), //Change Progress Indicator Color
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static hideLoadingDialog(GlobalKey key) {
      return Navigator.of(key.currentContext, rootNavigator: true).pop();
  }
}


