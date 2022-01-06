import 'dart:io';


String prompt(String message) {
  print(message);
  String? answer = stdin.readLineSync();
  return answer!;
}
double number(String mssg) {
  print(mssg);
  double? number = double.parse(stdin.readLineSync()!);
  return number;
}
void operator(double num1, double num2, String op) {
  if ("+" == op) {
    print("Answer: ${num1 + num2}");
  } else if ("-" == op) {
    print("Answer: ${num1 - num2}");
  } else if ("*" == op) {
    print("Answer: ${num1 * num2}");
  } else if ("/" == op) {
    print("Answer: ${num1 / num2}");
  } else {
    print("Wrong Operator!!!");
  }
}
void main() {
  print("Maths calculator");
  double firstNum = number("Enter First Number: ");
  double secondNum = number("Enter Second Number: ");
  String op = prompt("Enter Operator: ");
  operator(firstNum, secondNum, op);
}

