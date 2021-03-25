import 'package:example_project/widgets/Buttons/gradient_text_button.dart';
import 'package:example_project/widgets/Textfields/textfield_normal.dart';
import 'package:flutter/material.dart';
import '../../widgets/theme/textfield_theme.dart';
import '../../widgets/Alerts/loading_indicator.dart';

class TestButtonPage extends StatefulWidget {
  const TestButtonPage({Key key}) : super(key: key);

  @override
  _TestButtonPageState createState() => _TestButtonPageState();
}

class _TestButtonPageState extends State<TestButtonPage> {
  final _formKey = GlobalKey<FormState>();
  final _loadingKey = GlobalKey<State>();
  final TextEditingController _tfController = TextEditingController();

  Widget textFieldTest() {
    return TextFormFieldNormal(
      // titleText: 'qwe',
      hintText: 'test',
      prefixIcon: Icon(Icons.people),
      enabledBorder: enabledBorderTheme,
      focusedBorder: focusBorder,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _tfController,
      functionValidate: validateTextField,
      tfPadding: EdgeInsets.all(8),
    );
  }

  Future<void> validation(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus(); //dismiss keyboard
      try {
        LoadingDialog.showLoadingDialog(
            context, _loadingKey); //Show Loading Indicator
        await Future.delayed(Duration(seconds: 2));
        LoadingDialog.hideLoadingDialog(_loadingKey); //Hide Loading Indicator
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  void dispose() {
    _tfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Button'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  textFieldTest(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GradientTextButton(
                      onPressed: () {
                        print('left');
                        validation(context);
                      },
                      text: 'Left Button',
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.blue],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GradientTextButton(
                      onPressed: () {
                        print('right');
                        
                      },
                      text: 'Right Button',
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.red],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GradientTextButton(
              onPressed: () {},
              text: 'qweqwe',
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.red],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              padding: EdgeInsets.all(8),
              cornerRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
