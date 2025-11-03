import 'dart:io';

void main() {
  stdout.write('Enter a string: ');
  String input = stdin.readLineSync()!;
  String reversed = input.split('').reversed.join();
  print('Reversed string: $reversed');
}
