import 'dart:io';
// ============================================
// SIMPLE CALCULATOR - CONSOLE APPLICATION
// ============================================
class Calculator {
// Addition
double add(double a, double b) {
return a + b;
}
// Subtraction
double subtract(double a, double b) {
return a - b;
}
// Multiplication
double multiply(double a, double b) {
return a * b;
}
// Division
double divide(double a, double b) {
if (b == 0) {
throw ArgumentError('Cannot divide by zero!');
}
return a / b;
}
// Modulus
double modulus(double a, double b) {
if (b == 0) {
throw ArgumentError('Cannot perform modulus with zero!');
}
return a % b;
}
// Power
double power(double a, double b) {
double result = 1;
for (int i = 0; i < b.abs(); i++) {
result *= a;
}
return b < 0 ? 1 / result : result;
}
// Perform calculation based on operator
double calculate(double num1, double num2, String operator) {
switch (operator) {
case '+':
return add(num1, num2);
case '-':
return subtract(num1, num2);
case '*':
case 'x':
return multiply(num1, num2);
case '/':
return divide(num1, num2);
case '%':
return modulus(num1, num2);
case '^':
return power(num1, num2);
default:
throw ArgumentError('Invalid operator: $operator');
}
}
}
// ============================================
// INPUT VALIDATION FUNCTIONS
// ============================================
double? getNumberInput(String prompt) {
stdout.write(prompt);
String? input = stdin.readLineSync();
if (input == null || input.isEmpty) {
return null;
}
try {
return double.parse(input);
} catch (e) {
return null;
}
}
String? getOperatorInput() {
stdout.write('Enter operator (+, -, *, /, %, ^): ');
String? operator = stdin.readLineSync();
if (operator == null || operator.isEmpty) {
return null;
}
List<String> validOperators = ['+', '-', '*', 'x', '/', '%', '^'];
if (validOperators.contains(operator.toLowerCase())) {
return operator.toLowerCase();
}
return null;
}
// ============================================
// DISPLAY FUNCTIONS
// ============================================
void displayWelcome() {
print('\n╔════════════════════════════════════════╗');
print('║ SIMPLE CALCULATOR APP ║');
print('║ Console Application ║');
print('╚════════════════════════════════════════╝\n');
print('Available Operations:');
print(' + : Addition');
print(' - : Subtraction');
print(' * or x : Multiplication');
print(' / : Division');
print(' % : Modulus');
print(' ^ : Power');
print('\n Type "exit" or "quit" to close the app\n');
}
void displayResult(double num1, double num2, String operator, double result) {
print('\n' + '─' * 40);
print('CALCULATION RESULT:');
print('─' * 40);
print('$num1 $operator $num2 = $result');
print('─' * 40 + '\n');
}
void displayError(String message) {
print('\n❌ ERROR: $message\n');
}
// ============================================
// MAIN CALCULATOR FUNCTION
// ============================================
void runCalculator() {
Calculator calc = Calculator();
while (true) {
// Get first number
double? num1 = getNumberInput('Enter first number: ');
// Check for exit
if (num1 == null) {
String? input = stdin.readLineSync();
if (input?.toLowerCase() == 'exit' || input?.toLowerCase() == 'quit') {
print('\n👋 Thank you for using the calculator! Goodbye!\n');
break;
}
displayError('Invalid number! Please enter a valid number.');
continue;
}
// Get operator
String? operator = getOperatorInput();
if (operator == null) {
displayError('Invalid operator! Please use +, -, *, /, %, or ^');
continue;
}
// Get second number
double? num2 = getNumberInput('Enter second number: ');
if (num2 == null) {
displayError('Invalid number! Please enter a valid number.');
continue;
}
// Perform calculation
try {
double result = calc.calculate(num1, num2, operator);
displayResult(num1, num2, operator, result);
} catch (e) {
displayError(e.toString());
}
// Ask if user wants to continue
stdout.write('Do you want to perform another calculation? (yes/no): ');
String? response = stdin.readLineSync()?.toLowerCase();
if (response != 'yes' && response != 'y') {
print('\n👋 Thank you for using the calculator! Goodbye!\n');
break;
}
print('\n');
}
}
// ============================================
// QUICK CALCULATION MODE (for testing)
// ============================================
void quickCalculation(double num1, double num2, String operator) {
Calculator calc = Calculator();
try {
double result = calc.calculate(num1, num2, operator);
print('$num1 $operator $num2 = $result');
} catch (e) {
print('Error: $e');
}
}
void runQuickTests() {
print('\n╔════════════════════════════════════════╗');
print('║ QUICK TEST MODE ║');
print('╚════════════════════════════════════════╝\n');
quickCalculation(10, 5, '+');
quickCalculation(20, 8, '-');
quickCalculation(6, 7, '*');
quickCalculation(50, 5, '/');
quickCalculation(17, 5, '%');
quickCalculation(2, 8, '^');
print('\n✅ All quick tests completed!\n');
}
// ============================================
// MAIN FUNCTION
// ============================================
void main() {
displayWelcome();
// Uncomment the line below to run quick tests instead of interactive mode
// runQuickTests();
// Run the interactive calculator
runCalculator();
}