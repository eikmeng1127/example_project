import 'package:flutter/material.dart';
import '../theme/textfield_theme.dart';

class TextFormFieldNormal extends StatefulWidget {
  final String titleText;
  final String hintText;
  final Widget prefixIcon;
  final bool obsecureText;
  final OutlineInputBorder border;
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder focusedBorder;
  final AutovalidateMode autovalidateMode;
  final TextEditingController controller;
  final Function functionValidate;
  final EdgeInsets tfPadding;

  const TextFormFieldNormal({
    this.titleText,
    @required this.hintText,
    this.prefixIcon,
    this.obsecureText = false,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.autovalidateMode = AutovalidateMode.disabled,
    @required this.controller,
    this.functionValidate,
    this.tfPadding = const EdgeInsets.all(0),
  });

  @override
  _TextFormFieldNormalState createState() => _TextFormFieldNormalState();
}

class _TextFormFieldNormalState extends State<TextFormFieldNormal> {
  var inputText = "";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black87),
      child: Padding(
        padding: widget.tfPadding,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: widget.titleText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            // suffixIcon: hidingIcon(),
            filled: true,
            fillColor: Colors.white,
            border: widget.border,
            enabledBorder: widget.enabledBorder,
            focusedBorder: widget.focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 0),
          ),
          controller: widget.controller,
          autovalidateMode: widget.autovalidateMode,
          obscureText: widget.obsecureText,
          validator: (value) {
            if (widget.functionValidate != null) {
              String resultValidate = widget.functionValidate(value);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              inputText = value;
            });
          },
        ),
      ),
    );
  }

  Widget hidingIcon() {
    if (inputText.length > 0) {
      return IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.red,
          ),
          splashRadius: 1,
          onPressed: () {
            setState(() {
              widget.controller.clear();
              inputText = "";
            });
          });
    } else {
      return null;
    }
  }
}

String validateTextField(String value) {
  if (value.isEmpty) {
    return 'textfield must not be empty';
  } else if (value.trim().length < 4) {
    return 'text must contain at least 4 letters';
  }
  return null;
}

// String requiredValidator(String value, String messageError) {
//   if (value.isEmpty) {
//     return messageError;
//   }
//   return null;
// }
