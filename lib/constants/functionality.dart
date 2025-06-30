import 'package:calculator/constants/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Functionality {
  static String inputData = "";
  static bool isDotUsed = false;
  static bool isOperatorUsed = false;

  static void appendInput(String buttonClicked, Function setState) {
    setState(() {
      switch (buttonClicked) {
        case String digit when Buttons.digitButtons.contains(buttonClicked):
          inputData += digit;
          isOperatorUsed = false;
          break;

        case "AC":
          inputData = "";
          break;

        case "⌫":
          // dart string is Immutable  so cant directly remove the last element, so need to create a substring
          if (inputData.isNotEmpty) {
            inputData = inputData.substring(0, inputData.length - 1);
          }
          break;

        case ".":
          if (isDotUsed) {
            return;
          }
          if (inputData.isEmpty) {
            inputData += "0.";
            isDotUsed = true;
          } else {
            inputData += ".";
            isDotUsed = true;
          }
          break;

        case String operator
            when Buttons.operatorButtons.contains(buttonClicked):
          if (operator == "=" &&
              inputData.isNotEmpty &&
              !isLastValueOperator(inputData)) {
            String formattedInput = inputData.replaceAll("÷", "/");
            inputData = calResult(formattedInput);
          } else if (!isOperatorUsed && operator != "=") {
            inputData += operator;
            isOperatorUsed = true;
            isDotUsed = false;
          }
          break;
      }
    });
  }

  static String calResult(String expression) {
    ExpressionParser ep = GrammarParser();
    ContextModel contextModel = ContextModel();
    Expression exp = ep.parse(expression);

    double result = exp.evaluate(EvaluationType.REAL, contextModel);
    bool isInt = isInteger(result);
    if (isInt) {
      return result.toInt().toString();
    } else {
      return result.toStringAsFixed(2);
    }
  }

  static bool isInteger(double num) {
    if (num % 1 == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLastValueOperator(String s) {
    int len = s.length;
    return Buttons.operatorButtons.contains(s[len - 1]);
  }
}
