import 'dart:ui';

import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  final String text;
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final Gradient gradient;
  final EdgeInsets padding;
  final double cornerRadius;
  final Color textColor;
  final double textSize;

  const GradientTextButton(
      {Key key,
      @required this.onPressed,
      this.onLongPressed,
      this.child,
      @required this.text,
      @required this.gradient,
      this.padding = const EdgeInsets.all(0),
      this.cornerRadius = 10,
      this.textColor = Colors.white,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: onPressed,
        onLongPress: onLongPressed,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: isDisabledButton(onPressed, gradient),
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: Container(
            constraints: BoxConstraints(
              minWidth: 200,
              maxHeight: 50,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: textSize, color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // child: RaisedButton(
      //   color: Colors.transparent,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cornerRadius)),
      //   onPressed: onPressed,
      //   onLongPress: onLongPressed,
      //   padding: const EdgeInsets.all(0),
      //   child: Ink(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       gradient: isDisabledButton(onPressed, gradient),
      //       borderRadius: BorderRadius.circular(cornerRadius),
      //     ),
      //     child: Container(
      //       constraints: BoxConstraints(
      //         minWidth: 200,
      //         maxHeight: 50,
      //       ),
      //       alignment: Alignment.center,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             FittedBox(
      //               fit: BoxFit.cover,
      //               child: Text(
      //                 text,
      //                 style: TextStyle(fontSize: textSize, color: textColor),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Gradient isDisabledButton(onPressed, gradient) {
    if (onPressed == null) {
      return null;
    } else {
      return gradient;
    }
  }
}
