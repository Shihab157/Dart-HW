// 2. SUM OF LIST
// ============================================
// Using for loop
int sumOfListForLoop(List<int> numbers) {
int sum = 0;
for (int i = 0; i < numbers.length; i++) {
sum += numbers[i];
}
return sum;
}
// Using for-in loop
int sumOfListForIn(List<int> numbers) {
int sum = 0;
for (var num in numbers) {
sum += num;
}
return sum;
}
// Using reduce method
int sumOfListReduce(List<int> numbers) {
if (numbers.isEmpty) return 0;
return numbers.reduce((a, b) => a + b);
}
// Using fold method
int sumOfListFold(List<int> numbers) {
return numbers.fold(0, (sum, element) => sum + element);
}
void testSumOfList() {
print('╔════════════════════════════════════════╗');
print('║ SUM OF LIST ║');
print('╚════════════════════════════════════════╝\n');
List<int> numbers = [10, 20, 30, 40, 50];
List<int> emptyList = [];
List<int> negativeNumbers = [-5, 10, -3, 8, -1];
print('List: $numbers');
print('Sum (for loop): ${sumOfListForLoop(numbers)}');
print('Sum (for-in): ${sumOfListForIn(numbers)}');
print('Sum (reduce): ${sumOfListReduce(numbers)}');
print('Sum (fold): ${sumOfListFold(numbers)}');
print('\nEmpty list: $emptyList');
print('Sum: ${sumOfListFold(emptyList)}');
print('\nList with negatives: $negativeNumbers');
print('Sum: ${sumOfListFold(negativeNumbers)}');
print('');
}