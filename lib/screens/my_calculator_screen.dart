import 'package:calculator/constants/buttons.dart';
import 'package:calculator/constants/functionality.dart';
import 'package:calculator/widgets/my_buttons.dart';
import 'package:flutter/material.dart';

class MyCalculatorScreen extends StatefulWidget {
  @override
  State<MyCalculatorScreen> createState() => _MyCalculatorScreenState();
}

class _MyCalculatorScreenState extends State<MyCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  Functionality.inputData,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(indent: 10, endIndent: 10),
            Wrap(
              children: Buttons.allButtons
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MyButtons(
                        text: e,
                        onTap: () {
                          Functionality.appendInput(e, setState);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
