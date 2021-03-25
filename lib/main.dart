import 'package:example_project/screens/List/ListTesting.dart';
import 'package:example_project/screens/TestButton/TestButtonPage.dart';
import 'package:example_project/widgets/PageAnimation.dart/PageSlideAnimation.dart';
import 'package:flutter/material.dart';
import './others/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Test Button and TextField'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestButtonPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('qwe'),
            onTap: () {
              Navigator.push(
                context,
                PageSlideAnimation(
                  widget: ListTesting(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
