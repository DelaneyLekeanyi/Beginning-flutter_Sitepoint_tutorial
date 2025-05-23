import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String display = '0'; // Variable to store the current display value
  String _operator = ''; // Variable to store the current operator
  double _firstOperand = 0; // Variable to store the first operand
  bool _shouldClearDisplay = false; // Flag to determine if the display should be cleared
  String _expression = ''; // Variable to store the full expression
  //the expresion is the string that is shown in the display
  // Variable to store the full expression

  // Method to handle button presses
  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        // Clear the display and reset variables
        display = '0';
        _operator = ''; 
        _firstOperand = 0; // Reset first operand
        _shouldClearDisplay = false;
        _expression = '';
      } else if (text == '⌫') {
        // Handle backspace
        if (display.length > 1) {
          display = display.substring(0, display.length - 1);
          _expression = _expression.substring(0, _expression.length - 1);
        } else {
          display = '0';
          _expression = '';
        }
      } else if (text == '=') {
        // Perform calculation
        double secondOperand = double.tryParse(display) ?? 0;
        double result;
        switch (_operator) {
          case '+':
            result = _firstOperand + secondOperand;
            break;
          case '-':
            result = _firstOperand - secondOperand;
            break;
          case 'x':
            result = _firstOperand * secondOperand;
            break;
          case '/':
            if (secondOperand == 0) {
              display = 'Error'; // Handle division by zero
              _expression = 'Error';
              return;
            }
            result = _firstOperand / secondOperand;
            break;
          case '%':
            result = _firstOperand % secondOperand;
            break;
          default:
            result = secondOperand;
        }
        display = result.toString();
        _expression = display;
        _operator = '';
        _shouldClearDisplay = true;
      } else if ('+-x/%'.contains(text)) {
        // Handle operator input
        _firstOperand = double.tryParse(display) ?? 0;
        _operator = text;
        _expression += ' $text ';
        _shouldClearDisplay = true;
      } else {
        // Handle number and decimal input
        if (_shouldClearDisplay) {
          display = text;
          _expression += text;
          _shouldClearDisplay = false;
        } else {
          if (display == '0') {
            display = text;
            _expression = text;
          } else {
            display += text;
            _expression += text;
          }
        }
      }
    });
  }

//this secment og
  Widget calcButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Reduced padding
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text), // Call the button press handler
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color.fromARGB(255, 58, 120, 201),
            padding: const EdgeInsets.symmetric(vertical: 18), // Reduced vertical padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22, // Slightly reduced font size
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: const Color(0xFF22252D),
        elevation: 0,
        title: const Text('Sci-Calculator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            color: const Color(0xFF292D36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _expression,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  display,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      calcButton('C', color: const Color(0xFF272B33), textColor: Colors.orange),
                      calcButton('⌫', color: const Color(0xFF272B33)),
                      calcButton('%', color: const Color(0xFF272B33)),
                      calcButton('/', color: const Color.fromARGB(255, 71, 59, 40)),
                    ],
                  ),
                  const SizedBox(height: 10), // Reduced spacing
                  Row(
                    children: [
                      calcButton('7'),
                      calcButton('8'),
                      calcButton('9'),
                      calcButton('x', color: const Color.fromARGB(255, 71, 59, 40)),
                    ],
                  ),
                  const SizedBox(height: 10), // Reduced spacing
                  Row(
                    children: [
                      calcButton('4'),
                      calcButton('5'),
                      calcButton('6'),
                      calcButton('-', color: const Color.fromARGB(255, 71, 59, 40)),
                    ],
                  ),
                  const SizedBox(height: 10), // Reduced spacing
                  Row(
                    children: [
                      calcButton('1'),
                      calcButton('2'),
                      calcButton('3'),
                      calcButton('+', color: const Color.fromARGB(255, 71, 59, 40)),
                    ],
                  ),
                  const SizedBox(height: 10), // Reduced spacing
                  Row(
                    children: [
                      calcButton('00'),
                      calcButton('0'),
                      calcButton('.', color: const Color(0xFF272B33)),
                      calcButton('=', color: const Color.fromARGB(255, 71, 59, 40)),
                    ],
                  ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
