import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String result = "";
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    textInputAction: TextInputAction.next,
                    controller: c1,
                    decoration: const InputDecoration(
                        hintText: "Number 1",
                        hintStyle: TextStyle(fontSize: 12)),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    textInputAction: TextInputAction.next,
                    controller: c2,
                    decoration: const InputDecoration(
                        hintText: "Operator",
                        hintStyle: TextStyle(fontSize: 12)),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[+-X%]'))
                    ],
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    textInputAction: TextInputAction.next,
                    controller: c3,
                    decoration: const InputDecoration(
                        hintText: "Number 2",
                        hintStyle: TextStyle(fontSize: 12)),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  result = calculate();
                });
              },
              child: const Text("Press To Calculate")),
          const SizedBox(height: 20),
          Text(
            result,
            style: const TextStyle(
                fontSize: 32, color: Color.fromARGB(255, 209, 126, 154)),
          )
        ],
      ),
    );
  }

  String calculate() {
    if (c1.text.isNotEmpty && c2.text.isNotEmpty && c3.text.isNotEmpty) {
      final firstValue = double.parse(c1.text);
      final secondValue = double.parse(c3.text);
      if (c2.text == '+') {
        return (firstValue + secondValue).toString();
      } else if (c2.text == '-') {
        return (firstValue - secondValue).toString();
      } else if (c2.text == 'X') {
        return (firstValue * secondValue).toString();
      } else {
        return (firstValue % secondValue).toString();
      }
    } else {
      return "Lütfen tüm boşlukları doldurunuz";
    }
  }
}
