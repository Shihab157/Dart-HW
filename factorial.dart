// 1. FACTORIAL CALCULATION
// ============================================
// Using iterative approach
int factorialIterative(int n) {
if (n < 0) {
throw ArgumentError('Factorial not defined for negative numbers');
}
int result = 1;
for (int i = 2; i <= n; i++) {
result *= i;
}
return result;
}
// Using recursive approach
int factorialRecursive(int n) {
if (n < 0) {
throw ArgumentError('Factorial not defined for negative numbers');
}
if (n == 0 || n == 1) {
return 1;
}
return n * factorialRecursive(n - 1);
}
void testFactorial() {
print('\n╔════════════════════════════════════════╗');
print('║ FACTORIAL CALCULATION ║');
print('╚════════════════════════════════════════╝\n');
List<int> testNumbers = [0, 1, 5, 7, 10];
for (int num in testNumbers) {
int iterResult = factorialIterative(num);
int recResult = factorialRecursive(num);
print('Factorial of $num:');
print(' Iterative: $iterResult');
print(' Recursive: $recResult');
print('');
}
}