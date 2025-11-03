void main() {
  List<int> numbers = [2, 5, 8, 3, 1];
  int sum = numbers.reduce((a, b) => a + b);
  print('Sum of list: $sum');
}
