3. REVERSE STRING
// ============================================
// Using built-in methods
String reverseStringBuiltIn(String str) {
return str.split('').reversed.join('');
}
// Using for loop
String reverseStringForLoop(String str) {
String reversed = '';
for (int i = str.length - 1; i >= 0; i--) {
reversed += str[i];
}
return reversed;
}
// Using recursion
String reverseStringRecursive(String str) {
if (str.isEmpty) {
return str;
}
return reverseStringRecursive(str.substring(1)) + str[0];
}
// Using StringBuffer (more efficient for large strings)
String reverseStringBuffer(String str) {
StringBuffer buffer = StringBuffer();
for (int i = str.length - 1; i >= 0; i--) {
buffer.write(str[i]);
}
return buffer.toString();
}
void testReverseString() {
print('╔════════════════════════════════════════╗');
print('║ REVERSE STRING ║');
print('╚════════════════════════════════════════╝\n');
List<String> testStrings = [
'Hello',
'Dart Programming',
'racecar',
'A man a plan a canal Panama',
'12345'
];
for (String str in testStrings) {
print('Original: "$str"');
print('Reversed (built-in): "${reverseStringBuiltIn(str)}"');
print('Reversed (for loop): "${reverseStringForLoop(str)}"');
print('Reversed (recursive): "${reverseStringRecursive(str)}"');
print('Reversed (buffer): "${reverseStringBuffer(str)}"');
// Check if palindrome
bool isPalindrome = str.replaceAll(' ', '').toLowerCase() ==
reverseStringBuiltIn(str).replaceAll(' ', '').toLowerCase();
print('Is Palindrome: $isPalindrome');
print('');
}
}