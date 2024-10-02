import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  String _output = "0";        // Current number/output
  String _operand = "";        // Stores operator
  double _num1 = 0.0;          // First operand
  double _num2 = 0.0;          // Second operand
  bool _hasDecimal = false;    // Flag to track if a decimal has been entered

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],  
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 28,  
            fontWeight: FontWeight.bold,  
          ),
        ),
        centerTitle: true,  
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
               
                _buildButtonRow(["1", "2", "3", "/"]),
                _buildButtonRow(["4", "5", "6", "*"]),
                _buildButtonRow(["7", "8", "9", "-"]),
                _buildButtonRow(["0", ".", "C", "+"]),  
                _buildButtonRow(["="]),  
              ],
            ),
          ),
        ],
      ),
    );
  }

  // method to create button rows
  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return _buildButton(buttonText);
        }).toList(),
      ),
    );
  }

  //method to create individual buttons
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

  // Logic for button presses
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // Reset the calculator 
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
        _hasDecimal = false;
      } else if (buttonText == ".") {
        // Check if a decimal has already been entered
        if (!_output.contains(".")) {
          _output += ".";
        }
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        // Store the first operand and the operator
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = "0";  // Reset output for the second operand input
        _hasDecimal = false;  // Reset decimal flag for the next number
      } else if (buttonText == "=") {
        // Perform the calculation based on the operator
        _num2 = double.parse(_output);  // Convert current output to the second operand
        switch (_operand) {
          case "+":
            _output = (_num1 + _num2).toString();  
            break;
          case "-":
            _output = (_num1 - _num2).toString();  
            break;
          case "*":
            _output = (_num1 * _num2).toString();  
            break;
          case "/":
            _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";  // Handle division by zero
            break;
        }
        _num1 = 0;  // Reset operands after calculation
        _num2 = 0;
        _operand = "";
        _hasDecimal = false;  // Reset decimal flag after the calculation
      } else {
        // Handle number input
        if (_output == "0") {
          _output = buttonText;  
        } else {
          _output += buttonText; 
        }
      }
    });
  }
}
