import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String display = '0';

  // You can add logic for button presses here

  Widget calcButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              // Simple display logic for demo
              if (display == '0') {
                display = text;
              } else {
                display += text;
              }
              if (text == 'C') display = '0';
              if (text == '=') display = '0'; // Placeholder for calculation
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color.fromARGB(255, 58, 120, 201),
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.bold,
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
            child: Text(
              display,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Buttons
          Expanded(
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
                const SizedBox(height: 15),
                Row(
                  children: [
                    calcButton('7'),
                    calcButton('8'),
                    calcButton('9'),
                    calcButton('x', color: const Color.fromARGB(255, 71, 59, 40)),
                  ],
                ),
                 const SizedBox(height: 15),
                Row(
                  children: [
                    calcButton('4'),
                    calcButton('5'),
                    calcButton('6'),
                    calcButton('-', color: const Color.fromARGB(255, 71, 59, 40)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    calcButton('1'),
                    calcButton('2'),
                    calcButton('3'),
                    calcButton('+', color: const Color.fromARGB(255, 71, 59, 40)),
                  ],
                ),
                const SizedBox(height: 15),
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
        ],
      ),
    );
  }
}