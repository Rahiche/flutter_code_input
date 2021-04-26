import 'package:flutter/material.dart';
import 'package:code_input/code_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code input',
      color: Colors.deepOrange,
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Center(child: _buildCodeInput())
      ),
    );
  }

  Widget _buildCodeInput() {
    return CodeInput(
      length: 4,
      keyboardType: TextInputType.number,
      builder: CodeInputBuilders.lightCircle(),
      padding: EdgeInsets.all(5) ,
      onFilled: (value) => print('Your input is $value.'),
      onDone: (value) => print('Your input is $value.'),
    );
  }
}
