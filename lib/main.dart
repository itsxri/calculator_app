import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String output = "0";
}

@override
Widget build(BuildContext context)
{
  return Scaffold(
  appBar: AppBar(title: Text("Calculator")),
  body: Column(
    children: <Widget>[
      Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            output,
            style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Column(
          children: [
            _buildButtonRow(["7","8","9","/"]),
            _buildButtonRow(["4","5","6","*"]),
            _buildButtonRow(["1","2","3","-"]),
            _buildButtonRow(["0","C","=","+"]),
          ],
        ),
      ),
    ],
  ),  
    );
}
Widget _buildButtonRow(List<String> buttons){
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons.map((buttonText) {
        return _buildButton(buttonText);
      }).toList(),
  ),
  );
}
Widget _buildButton(String buttonText) {
  return Expanded(
    child: ElevatedButton(
     onPressed: () {
      buttonPressed(buttonText);
     },
     child: Text(
      buttonText,
      style: TextStyle(fontSize: 24.0),
     ),
    ),
  );
}

void buttonPressed(String buttonText){
  setState((){

  });
}
}