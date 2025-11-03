import 'dart:io';
import 'factorial.dart';
import 'sum_list.dart';
import 'reverse_string.dart';

void main() {
  print('\n=== Simple Calculator ===');
  stdout.write('Enter first number: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter operator (+, -, *, /): ');
  String op = stdin.readLineSync()!;

  stdout.write('Enter second number: ');
  double num2 = double.parse(stdin.readLineSync()!);

  double result;

  switch (op) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 != 0)
        result = num1 / num2;
      else {
        print('Error: Division by zero');
        return;
      }
      break;
    default:
      print('Invalid operator!');
      return;
  }

  print('Result: $num1 $op $num2 = $result');
}
